import 'package:flutter/material.dart';

void main() {
  Map<String, String> arts = {
    'bitcoin': 'art_bitcoin.jpg',
    'bitcoin dragon': 'art_bitcoinsv.jpg',
    'christmas': 'art_christmas.jpg',
    'intro it': 'art_intro_it.jpg',
    'intro': 'art_intro.jpg'
  };
  var title = "BitPaper - Bitcoin on Paper";
  var bitPaper = BitPaper(title: title, arts: arts, selected: "bitcoin", child: new MainPage());
  var app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    home: bitPaper,
  );
  runApp(app);
}

class BitPaper extends InheritedWidget {
  final Map<String, String> arts;
  final String title;
  final String selected;

  BitPaper({this.title, this.arts, this.selected, @required Widget child, Key key})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BitPaper>();
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BottomAppBar bottomBar = BottomAppBar(
      color: Colors.amber,
      child: Text("Status"),
    );
    String title = BitPaper.of(context).title;
    AppBar topBar = AppBar(title: Text(title));

    return Scaffold(
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
  }
}

class ArtsMenu extends StatelessWidget {
  ArtsMenu();

  Widget build(BuildContext context) {
    List<Widget> artsList = new List<Widget>();
    DrawerHeader header = DrawerHeader(child: Text("Paper Arts"));
    artsList.add(header);
    var arts = BitPaper.of(context).arts;
    arts.forEach((key, value) {
      var t = Text(key);
      var i = Image(
          image: NetworkImage('https://paperwallet.ejfhp.com/img/' + value));
      ListTile tI = ListTile(
        leading: i,
        title: t,
      );
      artsList.add(tI);
    });
    ListView list = ListView(children: artsList);
    return Drawer(
      child: list,
    );
  }
}
