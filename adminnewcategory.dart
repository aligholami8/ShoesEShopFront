import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:BemShop/adminhome.dart';
import 'package:BemShop/home.dart';
import 'package:BemShop/signin.dart';
import 'package:http/http.dart' as http;
late TextEditingController texteditt1;
late TextEditingController textedit2;
class adminnewcategory extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return adminnewcategorystate();
  }

}
class adminnewcategorystate extends State<adminnewcategory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    texteditt1=TextEditingController();
    textedit2=TextEditingController();
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
                    child: Text("New Category",style: TextStyle(
                        color: Colors.black,fontSize: 27
                    ),),
                  )
                ],
              ),
              SizedBox(
                height: size.height*0.05,
              ),
              SizedBox(
                width: size.width*0.8,
                height: size.height*0.5,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/catform1.png"))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      Center(
                        child: Text("Category Name is $catname",style: TextStyle(color: Colors.white54,fontSize: 20),),
                      ),
                      SizedBox(
                        height: size.height*0.12,
                      ),
                      Container(
                        width: size.width*0.7,
                        height: size.height*0.06,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: SizedBox(
                            width: size.width*0.55,
                            child: TextField(
                              controller: texteditt1,
                              decoration: InputDecoration(hintText: 'Category Name',hintStyle: TextStyle(fontSize: 15,color: Colors.black45),fillColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.06,
                      ),
                      SizedBox(
                        height: size.height*0.08,
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
                          ProductPost();

                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.05,
              ),
              GestureDetector(
                child: Container(
                  width: size.width*0.7,
                  height: size.height*0.06,
                  decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black38,width: 1),borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text("Edit Product" , style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, "/admineditproduct");
                },
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
  ProductPost ()async{
    print("p2");
    Map data = {
      'name': texteditt1.text,
      'parentId': null
    };
    print("p2");
    String body = json.encode(data);
    var res=await http.post(Uri.parse('https://golami2.paas.torphin.com/api/Categories'),headers: {"Content-Type": "application/json"},body:body);
    print(res.body);
    setState(() {
      print("p2");
    });
    var accescstoken=json.decode(res.body);
  }


}