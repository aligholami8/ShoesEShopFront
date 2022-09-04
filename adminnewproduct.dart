import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:BemShop/admineditproduct.dart';
import 'package:BemShop/adminhome.dart';
import 'package:BemShop/signin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
late TextEditingController edit1;
late TextEditingController edit2;
late TextEditingController edit3;
late TextEditingController edit4;
late TextEditingController edit5;
class adminnewproduct extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return adminnewproductstate();
  }
}
String message="";
List picsublist=[];
var path2;
var path3;
var file;
class adminnewproductstate extends State<adminnewproduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    edit1=TextEditingController();
    edit2=TextEditingController();
    edit3=TextEditingController();
    edit4=TextEditingController();
    edit5=TextEditingController();
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
              height: size.height*0.01,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: size.width*0.08),
                  child: Text("New Product",style: TextStyle(
                      color: Colors.black,fontSize: 27
                  ),),
                )
              ],
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            SizedBox(
              width: size.width,
              height: size.height*0.74,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/proform1.png"))
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Container(
                        width: size.width*0.7,
                        height: size.height*0.06,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: SizedBox(
                            width: size.width*0.55,
                            child: TextField(
                              controller: edit1,
                              decoration: InputDecoration(hintText: 'Product Name',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      Container(
                        width: size.width*0.7,
                        height: size.height*0.06,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: SizedBox(
                            width: size.width*0.55,
                            child: TextField(
                              controller: edit2,
                              decoration: InputDecoration(hintText: 'Price',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      Container(
                        width: size.width*0.7,
                        height: size.height*0.06,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: SizedBox(
                            width: size.width*0.55,
                            child: TextField(
                              controller: edit3,
                              decoration: InputDecoration(hintText: 'InStock',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      Container(
                        width: size.width*0.7,
                        height: size.height*0.06,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: SizedBox(
                            width: size.width*0.55,
                            child: TextField(
                              controller: edit4,
                              decoration: InputDecoration(hintText: 'Sizes',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      GestureDetector(
                        child: Container(
                          width: size.width*0.7,
                          height: size.height*0.06,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: SizedBox(
                              width: size.width*0.6,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Main Picture",style: TextStyle(fontSize: 15,color: Colors.black45),),
                                  Container(
                                    width: size.width*0.25,
                                    height: size.height*0.05,
                                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text("Browse",style: TextStyle(fontSize: 15,color: Colors.white),),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          sendphoto();
                        },
                      ),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      GestureDetector(
                        child: Container(
                          width: size.width*0.7,
                          height: size.height*0.06,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: SizedBox(
                              width: size.width*0.6,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sub Picture",style: TextStyle(fontSize: 15,color: Colors.black45),),
                                  Container(
                                    width: size.width*0.25,
                                    height: size.height*0.05,
                                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text("Browse",style: TextStyle(fontSize: 15,color: Colors.white),),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          sendphoto2();
                        },
                      ),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      Container(
                        width: size.width*0.7,
                        height: size.height*0.2,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: SizedBox(
                            width: size.width*0.55,
                            child: TextField(
                              controller: edit5,
                              decoration: InputDecoration(hintText: 'Description',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      GestureDetector(
                        child: SizedBox(
                          width: size.width*0.2,
                          height: size.height*0.05,
                          child:Center(
                            child:  Text("Save",style: TextStyle(color: Colors.white,fontSize: 24),),
                          ),
                        ),
                        onTap: (){
                          PrPost2();
                        },
                      ),
                      Text(message,style: TextStyle(fontSize: 11,color: Colors.white),)
                    ],
                  ),
                ),
              ),
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
      ),
    );
  }
  PrPost2 ()async{
    var t1="";
    var t2="0";
    var t3="0";
    var t4="0";
    var t5="";
    if(edit1.text !=null){
      t1=edit1.text;
    }
    if(edit2.text !=null){
      t2=edit2.text;
    }
    if(edit3.text !=null){
      t3=edit3.text;
    }
    if(edit4.text !=null){
      t4=edit4.text;
    }
    if(edit5.text !=null){
      t5=edit5.text;
    }
    print("p1");
    var list=[id];
    var request=http.MultipartRequest("POST",Uri.parse("https://golami2.paas.torphin.com/api/Products"));
    request.fields.addAll({
      'Name': t1,
      'Description': t5,
      'InStock': t3,
      'Price': t2,
      'CategoriesId': "$id",
      'Sizes': "$t4"
    });
    request.files.add(await http.MultipartFile.fromPath('MainPhoto', path2));
    for(int i=0;i<picsublist.length;i++){
      request.files.add(await http.MultipartFile.fromPath('SubPhoto', picsublist[i]));
    }
    print("end sublist");
    request.headers.addAll({"Content-Type": "multipart/form-data",'Authorization': 'Bearer $accescstoken'});

    http.StreamedResponse response = await request.send();
    print("send");
    setState(() {
      message="Add Product";
    });
    setState(() {
      print(response.statusCode);
    });
  }
  sendphoto() async {
    FilePickerResult? rest = await FilePicker.platform.pickFiles();
    if (rest != null) {
      path2 = rest.files.single.path.toString();
      print("file");
    }
  }
  sendphoto2() async {
    picsublist.clear();
    FilePickerResult? rest = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (rest != null) {
      // path3 = rest.files.single.path.toString();
      // print("file");
      for(PlatformFile file in rest.files){
        var name=file.path;
        picsublist.add(name);
      }
    }
  }
}