import 'package:flutter/material.dart';
import 'package:BemShop/admineditcategory.dart';
import 'package:BemShop/admineditproduct.dart';
import 'package:BemShop/admineditproductfinal.dart';
import 'package:BemShop/adminhome.dart';
import 'package:BemShop/adminnewcategory.dart';
import 'package:BemShop/adminnewproduct.dart';
import 'package:BemShop/card.dart';
import 'package:BemShop/categury.dart';
import 'package:BemShop/home.dart';
import 'package:BemShop/product.dart';
import 'package:BemShop/productlist.dart';
import 'package:BemShop/profile.dart';
import 'package:BemShop/profileedit.dart';
import 'package:BemShop/signin.dart';
import 'package:BemShop/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/signin",
      routes: {
        "/home" : (context) => home(),
        "/product" : (context) => product(),
        "/profile" : (context) => profile(),
        "/profileedit" : (context) => profileedit(),
        "/signin" : (context) => signin(),
        "/signup" : (context) => signup(),
        "/category" : (context) => category(),
        "/categoryproduct" : (context) => categoryproduct(),
        "/card" : (context) => card(),
        "/adminhome" : (context) => adminhome(),
        "/admineditproduct" : (context) => admineditproduct(),
        "/admineditproductfinal" : (context) => admineditproductfinal(),
        "/admineditcategory" : (context) => admineditcategory(),
        "/adminnewproduct" :(context) => adminnewproduct(),
        "/adminnewcategory":(context)=>adminnewcategory()


      }
      ,
    );
  }
}
