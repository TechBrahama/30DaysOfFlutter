import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final imageUrl =
    //  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fmobile.twitter.com%2Ffluttercomm&psig=AOvVaw0LlxtkTr0NBqxlKbzNLOp-&ust=1639139122843000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPiPx6Db1vQCFQAAAAAdAAAAABAL";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    "Aakash",
                    textScaleFactor: 1.8,
                  ),
                  accountEmail: Text("aakash@gmail.com"),
                  currentAccountPicture: Image.asset("assets/images/login.png"),
                )),
            Divider(
              color: Colors.white60,
              height: 20,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
              title: Text(
                "Phone",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
