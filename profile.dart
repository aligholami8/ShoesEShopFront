import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:BemShop/home.dart';
import 'package:BemShop/signin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';
var id=" ";
List bol=[false,false];
var fullname=" ";
late TextEditingController textedit1;
late TextEditingController textedit2;
class profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return profilestate();
  }

}
class profilestate extends State<profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profile();
    textedit1=TextEditingController();
    textedit2=TextEditingController();
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
              height: size.height*0.13,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: size.width*0.08),
                  child: Text("User ID :",style: TextStyle(
                      color: Colors.black,fontSize: 27
                  ),),
                )
              ],
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            Center(
              child: SizedBox(
                width: size.width*0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(child: (bol[0])?SizedBox(
                      width: size.width*0.4,
                      height: size.height*0.04,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: SizedBox(
                            width: size.width*0.35,
                            child: Center(
                              child: TextField(
                                controller: textedit1,
                                decoration: InputDecoration(hintText: 'Edit',hintStyle: TextStyle(fontSize: 15,color: Colors.white),fillColor: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ):SizedBox(
                      width: size.width*0.6,
                      height: size.height*0.02,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text("$id",style: TextStyle(color: Colors.white,fontSize: 12),),
                        ),
                      ),
                    ),visible: true,),
                    // GestureDetector(
                    //   child: SizedBox(
                    //     width: size.width*0.06,
                    //     height: size.width*0.06,
                    //     child: Container(
                    //       decoration: BoxDecoration(color: Colors.white,border: Border.all(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(30)),
                    //       child: Center(
                    //         child: Icon(Icons.edit,color: Colors.black,size: 16,),
                    //       ),
                    //     ),
                    //   ),
                    //   onTap: (){
                    //     setState(() {
                    //       bol[0]=!bol[0];
                    //     });
                    //   },
                    // )

                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: size.width*0.08),
                  child: Text("FullName :",style: TextStyle(
                      color: Colors.black,fontSize: 27
                  ),),
                )
              ],
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            Center(
              child: SizedBox(
                width: size.width*0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(child: (bol[1])?SizedBox(
                      width: size.width*0.4,
                      height: size.height*0.04,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: SizedBox(
                            width: size.width*0.35,
                            child: Center(
                              child: TextField(
                                controller: textedit2,
                                decoration: InputDecoration(hintText: 'Edit',hintStyle: TextStyle(fontSize: 15,color: Colors.white),fillColor: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ):SizedBox(
                      width: size.width*0.6,
                      height: size.height*0.02,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text("$fullname",style: TextStyle(color: Colors.white,fontSize: 12),),
                        ),
                      ),
                    ),visible: true,),
                    // GestureDetector(
                    //   child: SizedBox(
                    //     width: size.width*0.06,
                    //     height: size.width*0.06,
                    //     child: Container(
                    //       decoration: BoxDecoration(color: Colors.white,border: Border.all(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(30)),
                    //       child: Center(
                    //         child: Icon(Icons.edit,color: Colors.black,size: 16,),
                    //       ),
                    //     ),
                    //   ),
                    //   onTap: (){
                    //     setState(() {
                    //       bol[1]=!bol[1];
                    //     });
                    //   },
                    // )

                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.02,
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
  profile()async{
    print("p1");
    var acctoken=await SessionManager().get('AccessToken');
    final response = await http.get(Uri.parse('https://golami2.paas.torphin.com/api/Users/user-data'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $acctoken',
    });
    setState((){
      id=json.decode(response.body)['data']['id'];
      SessionManager().set('id',id);
      fullname=json.decode(response.body)['data']['fullname'];
      print(id);
      print(fullname);
    });
  }

}