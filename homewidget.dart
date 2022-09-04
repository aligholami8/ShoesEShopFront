import 'dart:convert';
import 'dart:math';
import 'package:BemShop/productlist.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:BemShop/admineditcategory.dart';
import 'package:BemShop/admineditproduct.dart';
import 'package:BemShop/adminhome.dart';
import 'package:BemShop/card.dart';
import 'package:BemShop/categury.dart';
import 'package:BemShop/profile.dart';
import 'package:BemShop/profileedit.dart';
import 'package:BemShop/signin.dart';
class homewidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return homewidgtestate();
  }

}
var name="";
var iddddlist=[];
var description="";
int price=0;
var mainphoto="";
var image="";

List names=[" "," "," "];
List pic=[" "," "," "];
List productlist=[];
List idlist=[];
List productlist2=[];
List prolist=[];
List idlist2=[];
class homewidgtestate extends State<homewidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product2();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
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
            height: size.height*0.04,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: size.width*0.08),
                child: Text("New Collection",style: TextStyle(
                    color: Colors.black,fontSize: 20
                ),),
              )
            ],
          ),
          SizedBox(
            height: size.height*0.04,
          ),
          Center(
            child: SizedBox(
              width: size.width*0.77,
              height: size.height*0.3,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: size.width*0.00),
                  child: Center(
                    child: GestureDetector(
                      child: SizedBox(
                        width: size.width*0.65,
                        height: size.height*0.3,
                        child: Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/cat2.png"))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width*0.02,
                              ),
                              Text(names[0],style: TextStyle(fontSize: 12,color: Colors.white70),),
                              SizedBox(
                                width: size.width*0.35,
                                height: size.height*0.1,
                                child: Image.network(pic[0],fit: BoxFit.cover,),
                              ),
                              SizedBox(
                                width: size.width*0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        id2=idlist2[0];
                        Navigator.pushNamed(context, "/product");
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height*0.01,
          ),
          Center(
            child: SizedBox(
              width: size.width*0.7,
              height: size.height*0.05,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14)
                ),
                child: Center(
                  child: Text("Popular",style: TextStyle(color: Colors.white,fontSize: 14),),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height*0.06,
          ),
          Center(
            child: SizedBox(
              width: size.width*0.9,
              child:Column(
                children: [
                  SizedBox(
                    width: size.width*0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: SizedBox(
                            width: size.width*0.38,
                            height: size.height*0.3,
                            child: Container(
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/pic.png"))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height*0.05,
                                  ),
                                  SizedBox(
                                    width: size.width*0.35,
                                    height: size.width*0.25,
                                    child: Image.network(pic[1],fit: BoxFit.cover,),
                                  ),
                                  SizedBox(
                                    height: size.height*0.04,
                                  ),
                                  Text(names[1],style: TextStyle(color: Colors.black,fontSize: 14),)
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            id2=idlist2[1];
                            Navigator.pushNamed(context, "/product");
                          },
                        ),
                        GestureDetector(
                          child: SizedBox(
                            width: size.width*0.38,
                            height: size.height*0.3,
                            child: Container(
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/pic.png"))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height*0.05,
                                  ),
                                  SizedBox(
                                    width: size.width*0.35,
                                    height: size.width*0.25,
                                    child: Image.network(pic[2],fit: BoxFit.cover,),
                                  ),
                                  SizedBox(
                                    height: size.height*0.04,
                                  ),
                                  Text(names[2],style: TextStyle(color: Colors.black,fontSize: 14),)
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            id2=idlist2[2];
                            Navigator.pushNamed(context, "/product");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
  product2()async{
    idlist.clear();
    catlist.clear();
    print("p1");
    var response = await http.get(Uri.parse('https://golami2.paas.torphin.com/api/Categories'),);
    //print(response.body);
    setState(() {
      productlist=json.decode(response.body)['data'];
      int index=productlist.length-1;
      for(int i =0 ; i<productlist.length;i++){
        idlist.add(json.decode(response.body)['data'][i]['id']);
      }
      for(int i =0 ; i<productlist.length;i++){
        catlist.add(json.decode(response.body)['data'][i]['name']);
      }
      print(productlist);
      print("f");
      print(idlist);
    });
    if(productlist.length != 0){
      print("in");
      product1();
    }
  }
  product1()async{
    idlist2.clear();
    productlist2.clear();
    prolist.clear();
    var ran=Random().nextInt(idlist.length);
    print("ran is $ran");
    var iddd=idlist[ran];
    print("idddd is $iddd");
    Map <String,String> data = {
      'categoryId': "$iddd",
    };
    print("p1");
    var body = json.encode(data);
    var response = await http.get(Uri.https('golami2.paas.torphin.com','/api/Products',data),);
    print(response.body);
    setState(() {
      productlist2=json.decode(response.body)['data'];
      int index=productlist2.length-1;
      for(int i =0 ; i<productlist2.length;i++){
        idlist2.add(json.decode(response.body)['data'][i]['id']);
      }
      for(int i =0 ; i<productlist2.length;i++){
        prolist.add(json.decode(response.body)['data'][i]['name']);
      }
      print(productlist2);
      print("idlist2 is $idlist2");
      var i=productlist2.length;
      for(int i=0;i<3;i++){
        names[i]=json.decode(response.body)['data'][i]['name'];
        print("m1");
        mainphoto=json.decode(response.body)['data'][i]['mainPhoto'];
        print("m4");
        image="https://golami2.paas.torphin.com"+mainphoto;
        print(image);
        pic[i]=image;
        print("pic is $pic");
      }
    });
  }

}