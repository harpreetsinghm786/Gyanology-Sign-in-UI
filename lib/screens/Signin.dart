import 'package:flutter/material.dart';
import 'package:gyanology/screens/Signup.dart';
import 'package:gyanology/screens/user/usermain.dart';

import '../constants.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();

}

class _SignupState extends State<Signin> {

  String? email,password;
  TextEditingController? _email,_password;
  bool ispassvisible=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email=new TextEditingController();
    _password=new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Sign In",style: getstyle(18, FontWeight.w500, green),),
          elevation: 0,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.help),color: Colors.grey,)
          ],
        ),
        body:SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("assets/images/signin.png"),
                ),

                Container(height: 50,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: light
                    ),
                    child:  buildemailFormField()
                ),
                SizedBox(height: 20,),

                Container(height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: light
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex:8,
                          child: buildpasswordFormField(),),
                        Expanded(
                          flex:1,
                          child: IconButton(
                            onPressed: (){
                              setState(() {
                                ispassvisible=! ispassvisible;
                              });
                            },
                            icon: Icon( ispassvisible?Icons.visibility:Icons.visibility_off),color: Colors.grey,),),


                      ],
                    )
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password?",style: getstyle(13, FontWeight.w500, textcolor),),

                    SizedBox(width: 10,),
                  ],
                ),
                SizedBox(height: 10,),


                FlatButton(
                    color: green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    onPressed: (){

                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>Usermain()));
                    }, child: Center(child: Text("Sign in",style: getstyle(13, FontWeight.normal, Colors.white),),)),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do not have an account? ",style: getstyle(13, FontWeight.normal, textcolor),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>Signup()));
                      },
                      child: Text("Sign up",style: getstyle(13, FontWeight.w500, textcolor),),
                    )


                  ],
                )



              ],
            ),
          ),
        )
    );
  }

  TextFormField buildemailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      controller: _email,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Email';
        }
        return null;
      },
      cursorColor: Colors.grey,
      style: TextStyle(color:Colors.grey,fontSize: 15),
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder:InputBorder.none,
        focusColor: c1,
        hintStyle: getstyle(15, FontWeight.normal, Colors.grey),
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }

  TextFormField buildpasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      controller: _password,
      obscureText: ispassvisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Password';
        }
        return null;
      },
      cursorColor: Colors.grey,
      style: TextStyle(color:Colors.grey,fontSize: 15,letterSpacing: 0),
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder:InputBorder.none,
        focusColor: c1,
        hintStyle: getstyle(15, FontWeight.normal, Colors.grey),
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }
}