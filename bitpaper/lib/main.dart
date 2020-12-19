import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'state.dart';
import 'wallet.dart';
import 'art.dart';
import 'dart:math' as math;

const appTitle = "BitPaper - Bitcoin on Paper";

void main() {
  var bitPaper = BitPaper();
  var app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    home: bitPaper,
  );
  runApp(app);
}

class BitPaper extends StatefulWidget {
  @override
  BitPaperState createState() => BitPaperState();
}

class BitPaperUI extends StatelessWidget {
  final BitPaperState state;

  BitPaperUI(this.state);

  @override
  Widget build(BuildContext context) {
    BottomAppBar bottomBar = BottomAppBar(
      color: Colors.amber,
      child: Text("Status"),
    );
    AppBar topBar = AppBar(title: Text(appTitle));

    return Scaffold(
      appBar: topBar,
      bottomNavigationBar: bottomBar,
      drawer: Menu(child: ArtsMenu(), state: state),
      body: Sheet(child: WalletSheet(), state: state),
    );
  }
}

class Menu extends InheritedWidget {
  final BitPaperState state;
  Menu({Key key, Widget child, this.state}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Menu oldWidget) {
    return oldWidget.state.selected != state.selected;
  }

  static Menu of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Menu>();
  }
}

class ArtsMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    BitPaperState appState = Menu.of(context).state;
    List<Widget> artsList = new List<Widget>.empty(growable: true);
    DrawerHeader header = DrawerHeader(child: Text("Paper Arts"));
    artsList.add(header);
    var arts = appState.arts;
    var selected = appState.selected;
    arts.forEach((key, value) {
      Widget t;
      if (key == selected) {
        t = Text(key, style: TextStyle(fontWeight: FontWeight.bold));
      } else {
        t = Text(key);
      }
      var i = Image.network(value.url);
      ListTile tI = ListTile(
        leading: i,
        title: t,
        onTap: () {
          appState.setSelected(key);
        },
      );
      artsList.add(tI);
    });
    ListView list = ListView(children: artsList);
    return Drawer(
      child: list,
    );
  }
}

class Sheet extends InheritedWidget {
  final BitPaperState state;

  Sheet({Key key, Widget child, this.state}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Sheet oldWidget) {
    return oldWidget.state.selected != state.selected;
  }

  static Sheet of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Sheet>();
  }
}

class WalletSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BitPaperState appState = Sheet.of(context).state;
    var art = appState.getSelectedArt();
    var wallets = appState.wallets;
    List<Paper> papers = List<Paper>.empty(growable: true);
    if (art != null && wallets != null) {
      wallets.forEach((w) {
        Paper p = Paper(wallet: w, art: art);
        papers.add(p);
      });
    }
    return Column(children: papers);
  }
}

class Paper extends StatelessWidget {
  final Wallet wallet;
  final Art art;

  Paper({this.wallet, this.art});

  @override
  Widget build(BuildContext context) {
    List<Widget> els = List<Widget>.empty(growable: true);
    els.add(Positioned.fill(
      child: Image.network(this.art.url),
    ));
    if (art.pk.visible) {
      els.add(getPaperElement(
          art.pk,
          Text(
            wallet.privateKey,
            style: TextStyle(fontSize: art.pk.size),
            textAlign: TextAlign.left,
          )));
    }
    if (art.pkQr.visible) {
      QrImage qr = QrImage(
        data: wallet.privateKey,
        version: QrVersions.auto,
        size: art.pkQr.size,
      );
      els.add(getPaperElement(art.pkQr, qr));
    }
    if (art.ad.visible) {
      els.add(getPaperElement(
          art.ad,
          Text(
            wallet.publicAddress,
            style: TextStyle(fontSize: art.ad.size),
            textAlign: TextAlign.left,
          )));
    }
    if (art.adQr.visible) {
      QrImage qr = QrImage(
        data: wallet.publicAddress,
        version: QrVersions.auto,
        size: art.adQr.size,
      );
      els.add(getPaperElement(art.adQr, qr));
    }
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black45),
          ),
          child: SizedBox(
            width: this.art.width,
            height: this.art.height,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.hardEdge,
              children: els,
            ))));
  }
}

Widget getPaperElement(ArtElement el, Widget child) {
  double angle = (el.rotation / 180) * math.pi;
  return Positioned(
    child: Transform.rotate(
      origin: Offset(0, 0),
      alignment: Alignment.centerLeft,
      angle: angle,
      child: child,
    ),
    top: el.top,
    left: el.left,
    width: el.width,
    height: el.height,
  );
}
