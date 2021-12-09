import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Container(
          child: Text("Welcome to my First Flutter App!!!!! "),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
