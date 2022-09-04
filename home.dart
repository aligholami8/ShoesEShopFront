import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:BemShop/homewidget.dart';
import 'package:BemShop/signin.dart';
class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return homestate();
  }

}

class homestate extends State<home> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: homewidget(),
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

}