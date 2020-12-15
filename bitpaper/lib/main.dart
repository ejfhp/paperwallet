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

    Scaffold scaff =  Scaffold(
      appBar: topBar,
      bottomNavigationBar: bottomBar,
      drawer: ArtsMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
    return MainPage(child: scaff, state: this);
  }

  void setSelected(String sel) {
    setState(() {
      selected = sel;
    });
  }
}


class Menu extends InheritedWidget {
  final _BitPaperState state;
  Menu({Key key, Widget child, this.state}): super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Menu oldWidget) {
    return oldWidget.state.selected != state.selected;
  }

  static Menu of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Menu>();
  }
}

class ArtsMenu extends StatelessWidget {
  ArtsMenu();

  Widget build(BuildContext context) {
    _BitPaperState appState = MainPage.of(context).state;
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
        onTap: () {appState.setSelected(key);},
      );
      artsList.add(tI);
    });
    ListView list = ListView(children: artsList);
    return Drawer(
      child: list,
    );
  }
}

class Menu extends InheritedWidget {
  final _BitPaperState state;
  Menu({Key key, Widget child, this.state}): super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Menu oldWidget) {
    return oldWidget.state.selected != state.selected;
  }

  static Menu of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Menu>();
  }
}

class ArtsWallet  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _BitPaperState appState = MainPage.of(context).state;
    var selectedImage = appState.arts[appState.selected];
    return Container(
     child: Center(
       child: Image(
          image: NetworkImage('https://paperwallet.ejfhp.com/img/' + selectedImage)
     ), 
     ),
    );
  }
}