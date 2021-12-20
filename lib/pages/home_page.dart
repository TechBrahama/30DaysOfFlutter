import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // it is a canavas which haves child
      // appBar: AppBar(
      //   title: Text(
      //     "Catalog App",
      //     //style: TextStyle(color: Colors.black),
      //   ),
      //   //backgroundColor: Colors.white,
      //   // iconTheme: IconThemeData(color: Colors.black),
      // ),
      // body: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      //     child: GridView.builder(
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         mainAxisSpacing: 16,
      //         crossAxisSpacing: 16,
      //       ),
      //       itemBuilder: (context, index) {
      //         final item = CatalogModel.items[index];
      //         return Card(
      //             clipBehavior: Clip.antiAlias,
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: GridTile(
      //               header: Text(item.name),
      //               child: Image.network(item.image),
      //               footer: Text(item.price.toString()),
      //             ));
      //       },
      //       itemCount: CatalogModel.items.length,
      //     )),

      // drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
