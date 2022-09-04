import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:BemShop/productlist.dart';
import 'package:BemShop/signin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class product extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return productstate();
  }

}
int count=0;
String name="";
String description="";
int price=0;
var mess="";
var selectsize;
String mainphoto="";
List subphoto=[];
List sizes=[];
String image="";
bool net=false;
class productstate extends State<product> {
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
        height: size.height,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/pbg.png"),fit: BoxFit.cover
              )
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width*0.06,
                  ),
                  GestureDetector(
                    child: SizedBox(
                      width: size.width*0.05,
                      height: size.width*0.05,
                      child: Image(image: AssetImage("assets/arrow.png"),),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              SizedBox(
                height: size.height*0.1,
              ),
              SizedBox(
                width: size.width*0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width*0.05,
                      height: size.width*0.05,
                      child: Image(image: AssetImage("assets/arrow.png"),),
                    ),
                    SizedBox(
                      width: size.width*0.8,
                      height: size.height*0.2,
                      child: (net==false)?Image(image: AssetImage("assets/product.png"),):Center(
                        child: SizedBox(
                          width: size.width*0.8,
                          height: size.height*0.2,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: subphoto.length,
                              itemBuilder: (BuildContext context , int indexx){
                                image="https://golami.paas.torphin.com"+subphoto[indexx];
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SizedBox(
                                    width: size.width*0.8,
                                    height: size.height*0.2,
                                    child: Image(image: NetworkImage(image),fit: BoxFit.cover,),
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width*0.05,
                      height: size.width*0.05,
                      child: Image(image: AssetImage("assets/arrow1.png"),),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.1,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: size.width,
        height: size.height*0.5,
        child:Container(
          width: size.width*85,
          height: size.height*0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
              color: Colors.white
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height*0.03,
              ),
              Row(
                children: [
                  Padding(
                    child: Text(name,style: TextStyle(color: Colors.black,fontSize: 27),),
                    padding: EdgeInsets.only(left: size.width*0.1),
                  ),
                ],
              ),
              SizedBox(
                height: size.height*0.002,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.1),
                  ),
                ],
              ),
              SizedBox(
                height: size.height*0.03,
              ),
              Center(
                child: SizedBox(
                  width: size.width*0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price :",style: TextStyle(color: Colors.black54,fontSize: 16),),
                      SizedBox(
                        width: size.width*0.5,
                        child: Center(
                          child: Text(price.toString()+" €",style: TextStyle(color: Colors.black54,fontSize: 18),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: size.width*0.1),
                    child: Text("Description",style: TextStyle(color: Colors.black,fontSize: 18),),
                  ),
                ],
              ),
              SizedBox(
                height: size.height*0.01,
              ),
             Center(
               child:  Padding(padding: EdgeInsets.only(left: 0),
                 child:SizedBox(
                   width: size.width*0.8,
                   height: size.height*0.05,
                   child:  Text(description,style: TextStyle(color: Colors.black54,fontSize: 14),),
                 ),
               ),
             ),
              SizedBox(height: size.height*0.05,),
              Center(
                child: SizedBox(
                    width: size.width*0.6,
                    height: size.height*0.05,
                    child:Center(
                      child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sizes.length,itemBuilder: (BuildContext contetx,int index){
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(right: 30),
                            width: size.width*0.1,
                            height: size.width*0.05,
                            decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(sizes[index].toString(),style: TextStyle(color: Colors.white,fontSize: 13),),
                            ),
                          ),
                          onTap: (){
                            selectsize=sizes[index];
                            setState(() {
                              mess="Select Size Is $selectsize";
                            });
                          },
                        );
                      }),
                    )
                ),
              ),
              SizedBox(
                width: size.width*0.8,
                height: size.height*0.06,
                child: Center(
                  child: Text(mess,style: TextStyle(color: Colors.black54,fontSize: 14),),
                ),
              ),
              GestureDetector(
                child: Container(
                  width: size.width*0.8,
                  height: size.height*0.07,
                  decoration: BoxDecoration(
                      color: Color(0xff38B4AC),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(
                    child: Text("Shop Now",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ),
                onTap: (){
                  Pr();
                  final snackBar=SnackBar(content: Text("Add To Order"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),




            ],
          ),

        ),
      ),
    );
  }
  product1()async{
    name="";
    mess="";
    description="";
    price=0;
    mainphoto="";
    subphoto.clear();
    print(id2);
    print("p111111111");
    var response = await http.get(Uri.parse("https://golami2.paas.torphin.com/api/Products/$id2"),);
    print(response.body);
    setState(() {
      name=json.decode(response.body)['data']['name'];
      description=json.decode(response.body)['data']['description'];
      price=json.decode(response.body)['data']['price'];
      mainphoto=json.decode(response.body)['data']['mainPhoto'];
      net=true;
      subphoto=json.decode(response.body)['data']['subPhoto'];
      sizes=json.decode(response.body)['data']['sizes'];
      if(sizes.length == 1){
        var tex=sizes[0].toString().split(",").toList();
        print(tex.length);
        sizes=tex;
      }
    });
  }
  Pr ()async{
    Map data = {
      'productId': id2,
    };
    print("p2 $id2");
    String body = json.encode(data);
    //print(accescstoken);
    var resoooo=await http.put(Uri.parse('https://golami2.paas.torphin.com/api/Orders/add-product-to-order?productId=$id2&size=$selectsize'),headers: {"Content-Type": "application/json",'Authorization': 'Bearer $accescstoken',});
    print(resoooo.statusCode);
    print(resoooo.body);
    setState(() {
      print("addd order");
    });
  }

}