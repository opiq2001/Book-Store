import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //appbar
    final appBar = AppBar(
      elevation: .5,
      title: Text('Keranjang'),
      
    );

    final body = ListView.builder(
      itemCount: 3,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 2.0
          ),
          child: Card(
            elevation: 4.0,
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text("Buku"),
              trailing: Icon(Icons.check_box),
            ),
          ),
        );
      }),
    );

    return Scaffold(
      backgroundColor: Colors.white,//Theme.of(context).primaryColor,
      appBar: appBar,
      body: body,
    );
  }
}