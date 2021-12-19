import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Colors.indigo).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(catalog.image)
            .box
            .rounded
            .p8
            .color(Colors.grey.shade100)
            .make()
            .p12()
            .w40(context),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(Colors.black).bold.make(),
            catalog.desc.text.coolGray400.make(),
            8.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.xl.bold.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(100).make().py16();
  }
}
