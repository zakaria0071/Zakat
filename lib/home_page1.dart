import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);


  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {

  late GlobalKey<ScaffoldState> _key;

  final drawerItems = [
    DrawerItem("Menu Zakat", Icons.book),
    DrawerItem("History Zakat", Icons.list),
    DrawerItem("Arrangement", Icons.settings)
  ];


  String _title = 'Zakat';
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
      //  return MenuPage();
      case 1:
       // return HistoryListPage();
      case 2:
     //   return SettingPage();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    Navigator.of(context).pop();
    setState(() {
      _selectedDrawerIndex = index;
      switch (index) {
        case 0:
          _title = 'Home';
          break;
        case 1:
          _title = 'History';
          break;
        case 2:
          _title = 'Pengaturan';
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();

    _title = 'Home';
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[
      DrawerHeader(
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Selamat Datang di Aplikasi Zakatax",
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      )
    ];

    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerOptions,
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}