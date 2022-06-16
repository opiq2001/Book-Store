import 'package:toko_buku/account.dart';
import 'package:toko_buku/cart.dart';
import 'package:toko_buku/searchpage.dart';

import 'data.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: .5,
      title: Text('Toko Buku'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_)=>SearchPage())),
        )
      ],
    );

    ///create book tile hero
    createTile(Book book) => Hero(
          tag: book.title,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.purple.shade900,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'detail/${book.title}');
              },
              child: Image(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

    ///create book grid tiles
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: books.map((book) => createTile(book)).toList(),
          ),
        )
      ],
    );

    //sidebar
    final sidebar = Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.account_circle, size: 100, color: Colors.white),
                    Text('Username', style: TextStyle(fontSize: 25, color: Colors.white),),
                  ]
                  ),
              ),//Text('Drawer Header', style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Beranda'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('Keranjang'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => const Cart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Akun'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => const Account()));
              },
            ),
          ]
        )
      );

    return Scaffold(
      backgroundColor: Colors.white,//Theme.of(context).primaryColor,
      appBar: appBar,
      body: grid,
      drawer: sidebar,
    );
  }
}