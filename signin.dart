import 'dart:convert';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:BemShop/home.dart';
import 'package:BemShop/product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
late TextEditingController textedit1;
late TextEditingController textedit2;
var accescstoken;
var admintoken="eyJhbGciOiJBMTI4S1ciLCJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwidHlwIjoiSldUIn0.z0qr_-gH39AoVuT9ip_n7H1QjEIAZMAfKxJjWBjfJ4ZDWxuXqcVmUw.31iqG4ShOpKgtAEzPf9RLw.AQLmSDkEle4JOZ5ZnsKguV-STBtyaeddTrzx7ZzTDyHIVz_s6GWc9SxR3dWYxmdf_Y1qkZYtg1-71t9yD8vcca5wjeIlIu9TWZB9GI52Uh_X0fZ7Sy5AIgt6kn96-GJvZfxOSl-AMr-FoWUxQlXiayApUrm_xpdnB065Fq88G55IXU0rfocfipLsMC2FaVQkX9MrAWPgSlD_PRJMeu1wLKytjBXUYIGw9Bec1qD4uIXpvIePeeqSd9IOYATvYQHDyauYctCh154F2lMXxKg0aMbM7Kzv1S5_Nwh97mgi7b8hpQ34-R_CYtLOEnDdCclNqYDSlrqpZ6POmog63x8CnsW_HIDU1oNsnqG7zr7lSfObn0815_pZeMK3cxkLW3zXTk7P3UB5Cyi4gIIXz5gX0it7vWavWqB8RcG1epg3u1aFZIDnTso1UDC-9d-rk9iRzOvxlIB_RXmvKHJPq3LMkHZC_7MiRrFbmR8SeGBZf8Og5YZ3gBMJ_ksMyPaDFO2ETr7TS6J5-FSYg8E7MkfP_FbOgFED8_A18rMobWgFRfmYmzMlRHxglssjE_QRGOmPnySX0e9j3cGZE0C0ex1ZLqr6jDDrRPsPNlI_s0VNgRwiAtVG8JQRZcKhi5krxohNEnkfhPhpfH-a2oSrFXyOL6CLV9GlXaG1DfRhW4vOjS0TNQ3sZxBezl_CNAgd1FRE.Bzqye-AF5zZrveftoe2iGA";
class signin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return signinstate();
  }

}
List ids=[];
String messgae="";
bool admin=true;
var resdata=false;
class signinstate extends State<signin> {
  final _Scaffoldkey=GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textedit1=TextEditingController();
    textedit2=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    double ke=MediaQuery.of(context).viewInsets.bottom;
    print("ke is $ke");
    var size=MediaQuery.of(context).size;
    return (ke == 0.0)?Scaffold(
      key: _Scaffoldkey,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg.png"),fit: BoxFit.cover)
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height*0.48,
                ),
                SizedBox(
                  width: size.width*0.9,
                  height: size.height*0.216,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffD9F1EF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height*0.013,
                          ),
                          SizedBox(
                            width: size.width*0.86,
                            height: size.height*0.08,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Center(
                                  child:SizedBox(
                                    width: size.width*0.78,
                                    height: size.height*0.06,
                                    child:TextField(
                                      controller: textedit1,
                                      decoration: InputDecoration(hintText: 'Username',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          SizedBox(
                            width: size.width*0.9,
                            height: size.height*0.003,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          SizedBox(
                            width: size.width*0.86,
                            height: size.height*0.08,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35)
                              ),
                              child: Center(
                                  child: SizedBox(
                                    width: size.width*0.86,
                                    height: size.height*0.08,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(35)
                                      ),
                                      child: Center(
                                          child:SizedBox(
                                            width: size.width*0.78,
                                            height: size.height*0.06,
                                            child:TextField(
                                              controller: textedit2,
                                              decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                            ),
                                          )
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.03,
                ),
                Text(messgae,style: TextStyle(color: Colors.black54,fontSize: 11),),
                SizedBox(
                  height: size.height*0.03,
                ),
                GestureDetector(
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text("Sign Up",style: TextStyle(color: Color(0xff38B4AC),fontSize: 12,decoration: TextDecoration.none),),
                        Container(
                          width: size.width*0.12,
                          height: size.height*0.004,
                          decoration: BoxDecoration(
                              color: Color(0xff38B4AC),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, "/signup");
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    width: size.width*0.8,
                    height: size.height*0.15,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/login.png"),fit: BoxFit.fitWidth
                          )
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      Signin();
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ):Scaffold(
      key: _Scaffoldkey,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg.png"),fit: BoxFit.cover)
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height*0.28,
                ),
                SizedBox(
                  width: size.width*0.9,
                  height: size.height*0.216,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffD9F1EF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height*0.013,
                          ),
                          SizedBox(
                            width: size.width*0.86,
                            height: size.height*0.08,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Center(
                                  child:SizedBox(
                                    width: size.width*0.78,
                                    height: size.height*0.06,
                                    child:TextField(
                                      controller: textedit1,
                                      decoration: InputDecoration(hintText: 'Username',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          SizedBox(
                            width: size.width*0.9,
                            height: size.height*0.003,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          SizedBox(
                            width: size.width*0.86,
                            height: size.height*0.08,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35)
                              ),
                              child: Center(
                                  child: SizedBox(
                                    width: size.width*0.86,
                                    height: size.height*0.08,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(35)
                                      ),
                                      child: Center(
                                          child:SizedBox(
                                            width: size.width*0.78,
                                            height: size.height*0.06,
                                            child:TextField(
                                              controller: textedit2,
                                              decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                            ),
                                          )
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.03,
                ),
                Text(messgae,style: TextStyle(color: Colors.black,fontSize: 13),),
                SizedBox(
                  height: size.height*0.03,
                ),
                GestureDetector(
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text("Sign Up",style: TextStyle(color: Color(0xff38B4AC),fontSize: 12,decoration: TextDecoration.none),),
                        Container(
                          width: size.width*0.12,
                          height: size.height*0.004,
                          decoration: BoxDecoration(
                              color: Color(0xff38B4AC),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, "/signup");
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    width: size.width*0.8,
                    height: size.height*0.15,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/login.png"),fit: BoxFit.fitWidth
                          )
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      Signin();
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future Signin ()async{
    Map data = {
      'username': textedit1.text,
      'password': textedit2.text
    };
    String body = json.encode(data);
    var res=await http.post(Uri.parse('https://golami2.paas.torphin.com/api/Users/login'),headers: {"Content-Type": "application/json"},body:body);
    var acc=json.decode(res.body)['data'];
    print(res.body);
    if(acc != null){
      print("in");
      accescstoken=json.decode(res.body)['data']['access_token'];
      setState(() {
        resdata=json.decode(res.body)['isSuccess'];
      });
      print(resdata);
      if(resdata == true){
        if(accescstoken==admintoken || textedit1.text=="admin"){
          setState(() {
            admin=false;
          });
        }
        Navigator.pushNamed(context, "/home");
      }
    }else{
      setState(() {
        messgae="Username Or Password Is Wrong";
      });
    }

  }

}

