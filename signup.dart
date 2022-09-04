import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
late TextEditingController textedit1;
late TextEditingController textedit2;
late TextEditingController textedit3;
class signup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return signupstate();
  }

}
class signupstate extends State<signup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textedit1=TextEditingController();
    textedit2=TextEditingController();
    textedit3=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    double ke=MediaQuery.of(context).viewInsets.bottom;
    var size=MediaQuery.of(context).size;
    return (ke==0.0)?Scaffold(
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
                  height: size.height*0.312,
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
                                  borderRadius: BorderRadius.circular(35)
                              ),
                              child: Center(
                                  child: SizedBox(
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
                                    width: size.width*0.78,
                                    height: size.height*0.06,
                                    child:TextField(
                                      controller: textedit2,
                                      decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
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
                                    width: size.width*0.78,
                                    height: size.height*0.06,
                                    child:TextField(
                                      controller: textedit3,
                                      decoration: InputDecoration(hintText: 'Fullname',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                    ),
                                  )
                              ),
                            ),
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
                GestureDetector(
                  child: SizedBox(
                    width: size.width*0.8,
                    height: size.height*0.15,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/signup.png"),fit: BoxFit.fitWidth
                          )
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      Signup();
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ):Scaffold(
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
                  height: size.height*0.20,
                ),
                SizedBox(
                  width: size.width*0.9,
                  height: size.height*0.312,
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
                                  borderRadius: BorderRadius.circular(35)
                              ),
                              child: Center(
                                  child: SizedBox(
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
                                    width: size.width*0.78,
                                    height: size.height*0.06,
                                    child:TextField(
                                      controller: textedit2,
                                      decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
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
                                    width: size.width*0.78,
                                    height: size.height*0.06,
                                    child:TextField(
                                      controller: textedit3,
                                      decoration: InputDecoration(hintText: 'Fullname',hintStyle: TextStyle(fontSize: 8,color: Colors.black),fillColor: Colors.green),
                                    ),
                                  )
                              ),
                            ),
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
                GestureDetector(
                  child: SizedBox(
                    width: size.width*0.8,
                    height: size.height*0.15,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/signup.png"),fit: BoxFit.fitWidth
                          )
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      Signup();
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
  Future Signup ()async{
    Map data = {
      "username": textedit1.text,
      "password": textedit2.text,
      "fullname": textedit3.text,
    };

    String body = json.encode(data);
    var res=await http.post(Uri.parse('https://golami2.paas.torphin.com/api/Users/register-user'),headers: {"Content-Type": "application/json"},body:body);
    print(res.statusCode);
    print(res.body);
    var resdata=json.decode(res.body)['isSuccess'];
    var duration=Duration(seconds: 1);
    if(resdata == true){
      setState(() {
        //state="Create Acount Successful";
      });
      new Timer(duration, ()async{
        Navigator.pushNamed(context, "/signin");
      });
    }else if (resdata == false){
      setState(() {
        //state="Create Acount Not Successful";
      });
    }
  }

}