import 'dart:convert';
import 'package:BemShop/signin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:BemShop/home.dart';

import 'package:flutter/material.dart';
class adminhome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return adminhomestate();
  }

}
var response;
var id;
var catname;
List idlist=[];
List productlist=[];
List Itemname=[];
class adminhomestate extends State<adminhome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product();
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
                  child: Text("Edit Category",style: TextStyle(
                      color: Colors.black,fontSize: 27
                  ),),
                )
              ],
            ),
            SizedBox(
              height: size.height*0.001,
            ),
            Center(
              child: SizedBox(
                width: size.width,
                height: size.height*0.5,
                child: ListView.builder(
                    itemCount: Itemname.length,
                    itemBuilder: (BuildContext context , int indexs){
                      return GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: size.width*0.8,
                          child:Padding(
                            padding: EdgeInsets.only(left: size.width*0.00),
                            child: Container(
                              width: size.width*0.8,
                              height: size.height*0.13,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/ecat1.png"))),
                              child: Center(
                                child: Text(Itemname[indexs],style: TextStyle(color: Colors.black45,fontSize: 26),),
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            id=idlist[indexs];
                            catname=Itemname[indexs];
                            print(id);
                            setState(() {
                              Navigator.pushNamed(context, "/admineditcategory");
                            });
                          });
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
                  Navigator.pushNamed(context, "/adminnewcategory");
                  final snackBar=SnackBar(content: Text("Add New Category"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
  product()async{
    print("start");
    Itemname.clear();
    idlist.clear();
    productlist.clear();
    response = await http.get(Uri.parse('https://golami2.paas.torphin.com/api/Categories'),);
    //print(response.body);
    setState(() {
      productlist=json.decode(response.body)['data'];
      for(int i=0;i<productlist.length;i++){
        idlist.add(json.decode(response.body)['data'][i]['id']);
      }
      for(int i=0;i<productlist.length;i++){
        Itemname.add(json.decode(response.body)['data'][i]['name']);
      }
      print(productlist.length);
      print("cat name in admin $Itemname");
      var i=productlist.length;
    });
  }
  product1()async{
    print("p1");
    response = await http.get(Uri.parse('https://golami2.paas.torphin.com/api/Categories'),);
    //print(response.body);
    setState(() {
      productlist=json.decode(response.body)['data'];
      int index=productlist.length-1;
      idlist.add(json.decode(response.body)['data'][index]['id']);
      print(productlist);
      print(idlist);
      var i=productlist.length;
    });
  }
  ProductPost ()async{
    print("p2");
    Map data = {
      'name': "Cat ",
      'parentId': null
    };
    print("p2");
    String body = json.encode(data);
    var res=await http.post(Uri.parse('https://golami2.paas.torphin.com/api/Categories'),headers: {"Content-Type": "application/json"},body:body);
    //print(res.statusCode);
    //print(res.body);
    setState(() {
      product1();
      print("p2");
    });
    var accescstoken=json.decode(res.body);
  }

}