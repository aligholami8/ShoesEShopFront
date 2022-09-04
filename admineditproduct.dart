import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:BemShop/adminhome.dart';
import 'package:BemShop/home.dart';
import 'package:BemShop/signin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class admineditproduct extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return admineditproductstate();
  }

}
var path;
List productlist2=[];
List proList=[];
List idlist2=[];
List piclist=[];
var image;
var idfinal;
var proname;
class admineditproductstate extends State<admineditproduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //productli();
    product1();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: size.width,
        //height: size.height,
        child:Column(
          children: [
            SizedBox(
              height: size.height*0.015,
            ),
            SizedBox(
              width: size.width*0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: SizedBox(
                      width: size.width*0.085,
                      height: size.height*0.085,
                      child: Image(image: AssetImage("assets/profile.png"),),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, "/profile");
                    },
                  ),
                  GestureDetector(
                    child: SizedBox(
                      width: size.width*0.07,
                      height: size.height*0.07,
                      child: Image(image: AssetImage("assets/card.png"),),
                    ),onTap: (){
                    Navigator.pushNamed(context, "/card");
                  },
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height*0.05,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: size.width*0.08),
                  child: Text("Edit Product",style: TextStyle(
                      color: Colors.black,fontSize: 27
                  ),),
                )
              ],
            ),
            SizedBox(
              height: size.height*0.05,
            ),
            Center(
              child: SizedBox(
                width: size.width*0.9,
                height: size.height*0.5,
                child: ListView.builder(
                    itemCount: productlist2.length,
                    itemBuilder: (BuildContext context , int index){
                      proname=proList[index];
                      image=piclist[index];
                      return GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: size.width*0.9,
                          child:Padding(
                            padding: EdgeInsets.only(left: size.width*0.00),
                            child: Container(
                              width: size.width*0.9,
                              height: size.height*0.12,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/epro1.png"))),
                              child: Center(
                                child: SizedBox(
                                  width: size.width*0.75,
                                  height: size.height*0.12,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Name is $proname",style: TextStyle(color: Colors.white54,fontSize: 18),),
                                      SizedBox(
                                        width: size.width*0.3,
                                        height: size.height*0.08,
                                        child: Image.network("https://golami2.paas.torphin.com$image"),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "/admineditproductfinal");
                          idfinal=idlist2[index];
                        },
                      );
                    }
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.025,
            ),
            GestureDetector(
              child: SizedBox(
                child: Container(
                  width: size.width*0.15,
                  height: size.width*0.15,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),border: Border.all(color: Colors.black,width: 1)),
                  child: Center(
                    child: Text("+",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ),
              ),
              onTap: (){
                setState(() {
                  final snackBar=SnackBar(content: Text("Add Product"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushNamed(context, "/adminnewproduct");
                  //PrPost2();


                });
              },
            ),

          ],
        ),
      ),
        bottomNavigationBar: Container(
          width: size.width,
          height: size.height*0.07,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black38,width: 0.03)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width*0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        width: size.width*0.08,
                        height: size.height*0.08,
                        child: Image(image: AssetImage("assets/home.png"),),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "/home");
                      },
                    ),
                    (admin ==true)?GestureDetector(
                      child: SizedBox(
                        width: size.width*0.08,
                        height: size.height*0.08,
                        child: Image(image: AssetImage("assets/category.png"),),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "/category");
                      },
                    ):SizedBox(
                      width: size.width*0.33,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: SizedBox(
                              width: size.width*0.08,
                              height: size.height*0.08,
                              child: Image(image: AssetImage("assets/category.png"),),
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, "/category");
                            },
                          ),
                          GestureDetector(
                            child: SizedBox(
                              width: size.width*0.08,
                              height: size.height*0.08,
                              child: Image(image: AssetImage("assets/admin.png"),),
                            ),
                            onTap: (){
                              setState(() {
                                Navigator.pushNamed(context, "/adminhome");
                              });
                            },
                          )
                        ],

                      ),
                    ),

                  ],
                ),

              )
            ],
          ),
        )
    );
  }
  product1()async{
    proList.clear();
    productlist2.clear();
    idlist2.clear();
    piclist.clear();
    print(id);
    Map <String,String> data = {
      'categoryId': "$id",
    };
    print("p1");
    var body = json.encode(data);
    var reponse = await http.get(Uri.https('golami2.paas.torphin.com','/api/Products',data),);
    print(reponse.body);
    setState(() {
      productlist2=json.decode(reponse.body)['data'];
      for(int i=0;i<productlist2.length;i++){
        proList.add(json.decode(reponse.body)['data'][i]['name']);
      }
      for(int i=0;i<productlist2.length;i++){
        idlist2.add(json.decode(reponse.body)['data'][i]['id']);
      }
      for(int i=0;i<productlist2.length;i++){
        piclist.add(json.decode(reponse.body)['data'][i]['mainPhoto']);
      }
      // //int index=productlist.length-1;
      // idlist.add(json.decode(response.body)['data'][index]['id']);
      // print(productlist);
      print(idlist2);
      var i=productlist.length;
      print(proList.length);
      print("product list name is $proList");
    });
  }
  
}