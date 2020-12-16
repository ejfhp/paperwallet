import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'wallet.dart';

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
  _BitPaperState createState() => _BitPaperState();
}

class _BitPaperState extends State<BitPaper> {
  Map<String, String> arts = {
    'bitcoin': 'art_bitcoin.jpg',
    'bitcoin dragon': 'art_bitcoinsv.jpg',
    'christmas': 'art_christmas.jpg',
    'intro it': 'art_intro_it.jpg',
    'intro': 'art_intro.jpg'
  };
  List<Wallet> wallets;
  String selected = "bitcoin";

  @override
  Widget build(BuildContext context) {

    wallets = List<Wallet>();
    Wallet w1 = Wallet();
    Wallet w2 = Wallet();
    wallets.add(w1);
    wallets.add(w2);
    return BitPaperUI(this);
  }

  void setSelected(String sel) {
    setState(() {
      selected = sel;
    });
  }
}

class BitPaperUI extends StatelessWidget {
  final _BitPaperState state;

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
  final _BitPaperState state;
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
    _BitPaperState appState = Menu.of(context).state;
    List<Widget> artsList = new List<Widget>();
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
      var i = Image(
          image: NetworkImage('https://paperwallet.ejfhp.com/img/' + value));
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
  final _BitPaperState state;

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
    _BitPaperState appState = Sheet.of(context).state;
    var selectedImage = appState.arts[appState.selected];
    var wallets = appState.wallets;
    List<Paper> papers = List<Paper>();
    wallets.forEach((element) {
      Paper p = Paper(
        image: Image(
          image: NetworkImage(
              'https://paperwallet.ejfhp.com/img/' + selectedImage),
        ),
        imageName: appState.selected,
        imageHeight: 400,
        imageWidth: 800,
        privateKey: element.privateKey,
        publicAddress: element.publicAddress,
      );
      papers.add(p);
    });
    return Column(children: papers);
  }
}

class Paper extends StatelessWidget {
  final String imageName;
  final Image image;
  final String publicAddress;
  final String privateKey;
  final double imageWidth;
  final double imageHeight;

  Paper(
      {this.imageName,
      this.image,
      this.imageWidth,
      this.imageHeight,
      this.privateKey,
      this.publicAddress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: this.imageWidth,
        height: this.imageHeight,
        child: Stack(
          children: [
            Positioned.fill(
              child: this.image,
            ),
            Positioned(
              child: RotatedBox(quarterTurns: 3, child: Text(this.privateKey)),
              top: 50,
              left: 50,
              width: 300,
            ),
            Positioned(
              child: QrImage(
                data: this.privateKey,
                version: QrVersions.auto,
                size: 300,
              ),
              top: 50,
              left: 50,
              width: 300,
            ),
            Positioned(
              child:
                  RotatedBox(quarterTurns: 3, child: Text(this.publicAddress)),
              top: 50,
              left: 50,
              width: 800,
            ),
            Positioned(
              child: QrImage(
                data: this.publicAddress,
                version: QrVersions.auto,
                size: 300,
              ),
              top: 50,
              left: 50,
              width: 800,
            ),
          ],
        ));
  }
}
