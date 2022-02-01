import 'package:flutter/material.dart';
import 'package:gyanology/screens/Signin.dart';
import 'package:gyanology/screens/phonenumber.dart';

import '../constants.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email,password,confirmpassword;
  TextEditingController? _email,_password,_confirmpassword;
  bool ispassvisible=true;
  bool isconfirmpassvisible=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email=new TextEditingController();
    _password=new TextEditingController();
    _confirmpassword=new TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Sign Up",style: getstyle(18, FontWeight.w500, green),),
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
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("assets/images/signup.png"),
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
                          child: buildconfirmpasswordFormField(),),
                        Expanded(
                          flex:1,
                          child: IconButton(
                            onPressed: (){
                              setState(() {
                                isconfirmpassvisible=! isconfirmpassvisible;
                              });
                            },
                            icon: Icon( isconfirmpassvisible?Icons.visibility:Icons.visibility_off),color: Colors.grey,),),


                      ],
                    )
                ),

                SizedBox(height: 20,),


                FlatButton(
                    color: green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    onPressed: (){

                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>Phonenumber()));
                    }, child: Center(child: Text("Continue",style: getstyle(13, FontWeight.normal, Colors.white),),)),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",style: getstyle(13, FontWeight.normal, textcolor),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context)=>Signin()), (route) => false);
                      },
                      child: Text("Sign in",style: getstyle(13, FontWeight.w500, textcolor),),
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
      obscureText:  ispassvisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Password';
        }
        return null;
      },
      cursorColor: Colors.grey,
      style: TextStyle(color:Colors.grey,fontSize: 15,letterSpacing: 0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        enabledBorder: InputBorder.none,
        focusedBorder:InputBorder.none,
        focusColor: c1,
        hintStyle: getstyle(15, FontWeight.normal, Colors.grey),
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }
  TextFormField buildconfirmpasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => confirmpassword = newValue!,
      controller: _confirmpassword,
      obscureText: isconfirmpassvisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Confirm Password';
        }

        if(value!=password.toString()){
          return 'Password and Confirm Password is not matching';
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
        hintText: "Confirm Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }



}
