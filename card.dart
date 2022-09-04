import 'package:flutter/material.dart';
import 'package:BemShop/signin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'home.dart';
late TextEditingController edit1;
late TextEditingController edit2;
late TextEditingController edit3;
List productlist2=[];
List idlist2=[];
var order;
var price=0.0;
List pricelist=[];
List namelist=[];
List countnumber=[];
List sizesss=[];
class card extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return cardstate();
  }

}
class cardstate extends State<card> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Pr();
    edit1=TextEditingController();
    edit2=TextEditingController();
    edit3=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
                  child: Text("Card",style: TextStyle(
                      color: Colors.black,fontSize: 27
                  ),),
                )
              ],
            ),
            SizedBox(
              height: size.height*0.05,
            ),
            Center(
              child: SizedBox(
                width: size.width,
                height: size.height*0.45,
                child: ListView.builder(
                    itemCount: productlist2.length,
                    itemBuilder: (BuildContext context , int index){
                      var price=pricelist[index].toString();
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        width: size.width*0.8,
                        child:Padding(
                          padding: EdgeInsets.only(left: size.width*0.00),
                          child: Container(
                            width: size.width*0.8,
                            height: size.height*0.2,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/card1.png"))),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height*0.1,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Text(namelist[index],style: TextStyle(color: Colors.black54,fontSize: 30),)],
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width*0.7,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size.width*0.3,
                                          child: Text("Price is $price €",style: TextStyle(color: Colors.black54,fontSize: 19),),
                                        ),
                                        SizedBox(width: size.width*0.04,),
                                        GestureDetector(
                                          child: SizedBox(
                                            width: size.width*0.1,
                                            height: size.width*0.1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: size.height*0.006),
                                                  child: Text("-",style: TextStyle(color: Colors.black,fontSize: 27),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: (){
                                            setState(() {
                                              Pr2(index);
                                              final snackBar=SnackBar(content: Text("Remove Item"));
                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: size.width*0.3,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(" Count :"+countnumber[index].toString(),style: TextStyle(color: Colors.black54,fontSize: 15),),
                                          Text(" Size :"+sizesss[index].toString(),style: TextStyle(color: Colors.black54,fontSize: 15),)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.025,
            ),
            SizedBox(
              width: size.width*0.85,
              child: Container(
                width: size.width*0.85,
                height: size.height*0.0005,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: size.height*0.03,
            ),
            SizedBox(
              width: size.width*0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total :" ,style: TextStyle(color: Colors.black,fontSize: 20),),
                  Text(price.toString()+" €",style: TextStyle(color: Colors.black,fontSize: 20),)
                ],
              ),
            ),
            SizedBox(
              height: size.height*0.05,
            ),
            GestureDetector(
              child: Container(
                width: size.width*0.8,
                height: size.height*0.06,
                decoration: BoxDecoration(color: Color(0xffD9F1EF),borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text("Pay" , style: TextStyle(color: Color(0xff1900FF),fontSize: 20),),
                ),
              ),
              onTap: (){
                // final snackBar=SnackBar(content: Text("Finalize Order"));
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      content: Container(
                        child: SizedBox(
                          width: size.width*0.9,
                          height: size.height*0.6,
                          child: Center(
                            child: SizedBox(
                              width: size.width*0.9,
                              height: size.height*0.6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width*0.9,
                                    height: size.height*0.05,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Fullname"),
                                        SizedBox(
                                          width: size.width*0.3,
                                          height: size.height*0.05,
                                          child: TextField(
                                            controller: edit3,
                                            decoration: InputDecoration(hintText: 'Fullname',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height*0.01,
                                  ),
                                  SizedBox(
                                    width: size.width*0.9,
                                    height: size.height*0.05,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Address"),
                                        SizedBox(
                                          width: size.width*0.3,
                                          height: size.height*0.05,
                                          child: TextField(
                                            controller: edit1,
                                            decoration: InputDecoration(hintText: 'Address',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height*0.01,
                                  ),
                                  SizedBox(
                                    width: size.width*0.9,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Number"),
                                        SizedBox(
                                          width: size.width*0.3,
                                          height: size.height*0.05,
                                          child: TextField(
                                            controller: edit2,
                                            decoration: InputDecoration(hintText: 'Phone Number',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height*0.05,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: size.width*0.5,
                                      height: size.height*0.05,
                                      decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(30)),
                                      child: Center(
                                        child: Text("Finalize",style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ),
                                    ),
                                    onTap: (){
                                      var payment=edit1.text+"/"+edit2.text;
                                      Pr3(payment);
                                      final snackBar=SnackBar(content: Text("Finalize Order"));
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                      ),
                    );
                  });
                });
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
  Pr ()async{
    print("ids is $ids");
    price=0;
    productlist2.clear();
    idlist2.clear();
    pricelist.clear();
    namelist.clear();
    countnumber.clear();
    sizesss.clear();
    Map data = {
      'Name': "String",
    };
    print("p2");
    String body = json.encode(data);
    //print(accescstoken);
    var resoooo=await http.get(Uri.parse('http://golami2.paas.torphin.com/api/Orders/active-order'),headers: {"Content-Type": "application/json",'Authorization': 'Bearer $accescstoken',});
    print(resoooo.statusCode);
    print(resoooo.body);
    print("p1");
    productlist2=json.decode(resoooo.body)['data']['products'];
    print(productlist2.length);
    order=json.decode(resoooo.body)['data']['orderId'].toString();
    print(order);
    print("p1");
    int index=productlist2.length-1;
    for(int i =0 ; i<productlist2.length;i++){
      idlist2.add(json.decode(resoooo.body)['data']['products'][i]['id']);
    }
    print("id list is $idlist2");
    for(int i =0 ; i<productlist2.length;i++){
      pricelist.add(json.decode(resoooo.body)['data']['products'][i]['price']);
    }
    for(int i =0 ; i<productlist2.length;i++){
      namelist.add(json.decode(resoooo.body)['data']['products'][i]['name']);
    }
    for(int i =0 ; i<productlist2.length;i++){
      countnumber.add(json.decode(resoooo.body)['data']['products'][i]['count']);
    }
    for(int i =0 ; i<productlist2.length;i++){
      sizesss.add(json.decode(resoooo.body)['data']['products'][i]['sizes']);
    }
    print("sezes is $sizesss");
    setState(() {
      print("active order");
      count();
    });
  }
  Prr ()async{
    productlist2.clear();
    Map data = {
      'Name': "String",
    };
    print("p2");
    String body = json.encode(data);
    //print(accescstoken);
    var resoooo=await http.get(Uri.parse('https://golami2.paas.torphin.com/api/Orders/all-orders'),headers: {"Content-Type": "application/json",'Authorization': 'Bearer $accescstoken',});
    print(resoooo.statusCode);
    print(resoooo.body);
    print("p1");
    productlist2=json.decode(resoooo.body)['data'][0]['products'];
    print(productlist2.length);
    order=json.decode(resoooo.body)['data'][0]['orderId'].toString();
    print(order);
    print("p1");
    int index=productlist2.length-1;
    setState(() {
      print("p2");
    });
  }
  Pr2 (int index)async{
    Map data = {
      'productId': idlist2[index],
    };
    print(idlist2[index]);
    String body = json.encode(data);
    print(accescstoken);
    var d=idlist2[index];
    var resoooo=await http.delete(Uri.parse('https://golami2.paas.torphin.com/api/Orders/remove-product-from-order?productId=$d'),headers: {"Content-Type": "application/json",'Authorization': 'Bearer $accescstoken',});
    print(resoooo.statusCode);
    print(resoooo.body);
    if(price>0){
      price=price-(pricelist[index]*countnumber[index]);
    }
    idlist2.removeAt(index);
    pricelist.removeAt(index);
    Prr();
    print("delete");
    print(pricelist);
    print(price);
    Pr();
  }
  Pr3 (var address)async{
    Map data = {
      'address': address,
    };
    print("p2");
    String body = json.encode(data);
    //print(accescstoken);
    var resoooo=await http.put(Uri.parse('https://golami2.paas.torphin.com/api/Orders/finalize-order/$order'),headers: {"Content-Type": "application/json",'Authorization': 'Bearer $accescstoken',},body: body);
    print(resoooo.statusCode);
    print(resoooo.body);
  }
  count(){
    for(int i=0;i<pricelist.length;i++){
      price=price+(pricelist[i]*countnumber[i]);
    }
    print(pricelist);
    print(price);
  }

}