import 'dart:convert';
import 'package:BemShop/signin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:BemShop/home.dart';
class category extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return categorystate();
  }

}
List idlist=[];
List productlist=[];
List catlist=[];
var id;
var num=0.0;
class categorystate extends State<category> {
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
                  child: Text("Category",style: TextStyle(
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
                width: size.width*95,
                height: size.height*0.5,
                child: ListView.builder(
                    itemCount: catlist.length,
                    itemBuilder: (BuildContext context , int indexx){
                      return GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: size.width*0.8,
                          child:Padding(
                            padding: EdgeInsets.only(right: size.width*0.05),
                            child: SizedBox(
                              width: size.width*0.9,
                              child:Padding(
                                padding: EdgeInsets.only(left: size.width*0.055),
                                child: Container(
                                  width: size.width*0.9,
                                  height: size.height*0.25,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/cat1.png"))),
                                  child: Center(
                                    child: Text(catlist[indexx],style: TextStyle(color: Colors.white54,fontSize: 25),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            id=idlist[indexx];
                            print(id);
                            setState(() {
                              Navigator.pushNamed(context, "/categoryproduct");
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
    print("p1");
    productlist.clear();
    idlist.clear();
    catlist.clear();
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
      print(productlist.length);
      num=(catlist.length)/2;
      print("categury name list is $catlist");
      print("categury id list is $idlist");
      var i=productlist.length;
    });
  }

}