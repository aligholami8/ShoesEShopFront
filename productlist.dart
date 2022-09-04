import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:BemShop/signin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:BemShop/home.dart';

import 'categury.dart';
class categoryproduct extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return categoryproductstate();
  }

}
var image;
List prolist=[];
List idlist2=[];
List productlist2=[];
List piclist=[];
var id2;
class categoryproductstate extends State<categoryproduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product1();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
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
                    child: Text("Product",style: TextStyle(
                        color: Colors.black,fontSize: 27
                    ),),
                  )
                ],
              ),
              SizedBox(
                height: size.height*0.11,
              ),
              Center(
                child: SizedBox(
                  width: size.width,
                  height: size.height*0.5,
                  child: ListView.builder(
                      itemCount: productlist2.length,
                      itemBuilder: (BuildContext context , int indexx){
                        image=piclist[indexx];
                        return GestureDetector(
                          child:Container(
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
                                    width: size.width*0.8,
                                    height: size.height*0.1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(prolist[indexx],style: TextStyle(color: Colors.white54,fontSize: 19),),
                                        SizedBox(
                                          width: size.width*0.3,
                                          height: size.height*0.08,
                                          child: Image.network("https://golami2.paas.torphin.com$image",fit: BoxFit.cover,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              id2=idlist2[indexx];
                              print(id2);
                              setState(() {
                                Navigator.pushNamed(context, "/product");
                              });
                            });
                          },
                        );
                      }
                  ),
                ),
              )
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
    prolist.clear();
    productlist2.clear();
    idlist2.clear();
    piclist.clear();
    print("id is $id");
    Map <String,String> data = {
      'categoryId': "$id",
    };
    print("p1");
    var body = json.encode(data);
    var response = await http.get(Uri.https('golami2.paas.torphin.com','/api/Products',data),);
    print(response.body);
    setState(() {
      productlist2=json.decode(response.body)['data'];
      for(int i =0 ; i<productlist2.length;i++){
        idlist2.add(json.decode(response.body)['data'][i]['id']);
      }
      for(int i =0 ; i<productlist2.length;i++){
        prolist.add(json.decode(response.body)['data'][i]['name']);
      }
      for(int i=0;i<productlist2.length;i++){
        piclist.add(json.decode(response.body)['data'][i]['mainPhoto']);
      }
      print(prolist.length);
      print("prolist is $prolist");
      var i=productlist2.length;
    });
  }

}