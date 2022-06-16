import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //appbar
    final appBar = AppBar(
      elevation: .5,
      title: Text('Akun'),
      
    );

    final List<String> entries = <String>['Riwayat Pembelian', 'Pengaturan Akun', 'Keluar'];
    final body = Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 100,
              ),
              title: Text('Taufiq'),
              subtitle: Text('@opiq01'),
            ),
            //const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.white,
                        child: Text( entries[index],),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  ),
                ),
              ),   
            ), 
          ],
        ),
    );
    
              

    return Scaffold(
      backgroundColor: Colors.white,//Theme.of(context).primaryColor,
      appBar: appBar,
      body: body,
    );
  }
}