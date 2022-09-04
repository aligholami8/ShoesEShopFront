import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:BemShop/admineditproduct.dart';
import 'package:BemShop/adminhome.dart';
import 'package:BemShop/home.dart';
import 'package:BemShop/signin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
late TextEditingController edit1;
late TextEditingController edit2;
late TextEditingController edit3;
late TextEditingController edit4;
late TextEditingController edit5;
class admineditproductfinal extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return admineditproductfinalstate();
  }

}
var file;
List n=[];
class admineditproductfinalstate extends State<admineditproductfinal> {
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
              height: size.height*0.02,
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
              height: size.height*0.02,
            ),
            SizedBox(
              width: size.width,
              height: size.height*0.7,
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
                              controller: edit2,
                              decoration: InputDecoration(hintText: 'Price',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
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
                              controller: edit3,
                              decoration: InputDecoration(hintText: 'InStock',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
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
                              controller: edit4,
                              decoration: InputDecoration(hintText: 'Sizes',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.03,
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
                          PrPost();
                        },
                      )
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
  PrPost ()async{
    n=[];
    print(idfinal);
    print(id);
    var t1="";
    var t2="0";
    var t3="0";
    var t4="";
    String ft="";
    var t5="";
    print(ft);
    if(edit1.text !=null){
      t1=edit1.text;
    }
    if(edit2.text !=null){
      t2=edit2.text;
    }
    if(edit3.text !=null){
      t3=edit3.text;
    }
    if(edit5.text !=null){
      t5=edit5.text;
    }
    if(edit4.text !=null){
      t4=edit4.text;
      var tt=t4.split(",").toList();
      print(tt);
      print(tt.length);
      for(int i=0;i<tt.length;i++){
        var v=tt[i];
        print(v);
        n.add('"$v"');
      }
      print(n);
    }
    var headers = {
      'authority': 'golami2.paas.torphin.com',
      'accept': 'text/plain',
      'accept-language': 'en-US,en;q=0.9,fa;q=0.8',
      'content-type': 'application/json',
      'cookie': 'SL_G_WPT_TO=en; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1',
      'origin': 'https://golami2.paas.torphin.com',
      'referer': 'https://golami2.paas.torphin.com/swagger/index.html',
      'sec-ch-ua': '"Chromium";v="104", " Not A;Brand";v="99", "Google Chrome";v="104"',
      'sec-ch-ua-mobile': '?1',
      'sec-ch-ua-platform': '"Android"',
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'same-origin',
      'user-agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Mobile Safari/537.36'
    };
    var request = http.Request('PUT', Uri.parse('https://golami2.paas.torphin.com/api/Products/$idfinal'));
    request.body = '''{  "id": $idfinal,  "name": "$t1",  "description": "$t5",  "inStock": $t3,  "price": $t2,  "categoriesId": [    $id  ],  "sizes": $n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }
  sendphoto() async {
    FilePickerResult? rest = await FilePicker.platform.pickFiles();
    if (rest != null) {
      path = rest.files.single.path.toString();
      print("file");
    }
  }

}