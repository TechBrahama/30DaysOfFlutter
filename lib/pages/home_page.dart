import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      // it is a canavas which haves child
      appBar: AppBar(
        title: Text(
          "Catalog App",
          //style: TextStyle(color: Colors.black),
        ),
        //backgroundColor: Colors.white,
        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return Itemwidget(
              //item: CatalogModel.items[index],
              item: dummylist[index],
            );
          },
        ),
      ),

      drawer: MyDrawer(),
    );
  }
}
