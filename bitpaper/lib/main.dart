import 'package:flutter/material.dart';

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
  String selected = "bitcoin";

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
      drawer: Menu(child: ArtsMenu(), state: this),
      body: Paper(child: ArtsPaper(), state: this),
    );
  }

  void setSelected(String sel) {
    setState(() {
      selected = sel;
    });
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

class Paper extends InheritedWidget {
  final _BitPaperState state;

  Paper({Key key, Widget child, this.state}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Paper oldWidget) {
    return oldWidget.state.selected != state.selected;
  }

  static Paper of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Paper>();
  }
}

class ArtsPaper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _BitPaperState appState = Paper.of(context).state;
    var selectedImage = appState.arts[appState.selected];
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Column(children: [
          Row(children: [
            Wrap(
              direction: Axis.vertical,
              children : [RotatedBox(
                quarterTurns: 1,
                child:Text("wallet address"))],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image(
                image: NetworkImage(
                    'https://paperwallet.ejfhp.com/img/' + selectedImage),
                height: 400,
                width: 800,
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
