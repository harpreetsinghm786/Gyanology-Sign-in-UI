import 'package:flutter/material.dart';

import '../constants.dart';

class Phonenumber extends StatefulWidget {
  const Phonenumber({Key? key}) : super(key: key);

  @override
  _PhonenumberState createState() => _PhonenumberState();
}

class _PhonenumberState extends State<Phonenumber> {

  String? phone;

  TextEditingController? _phone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phone=new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Sign up",style: getstyle(18, FontWeight.w500, green),),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.help),color: Colors.grey,)
        ],
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.asset("assets/images/phone.png"),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter your phone number we will \n send an OTP on it.",style: getstyle(12, FontWeight.normal, textcolor),textAlign: TextAlign.center,)
                    ],
                  ),

                  SizedBox(height: 15,),
                  Container(height: 50,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: light
                      ),
                      child:  buildphoneFormField()
                  ),
                  SizedBox(height: 20,),



                  FlatButton(
                      color: green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      onPressed: (){

                        // Navigator.push(context, new MaterialPageRoute(builder: (context)=>Usermain()));
                      }, child: Center(child: Text("Send Otp",style: getstyle(13, FontWeight.normal, Colors.white),),)),

                  SizedBox(height: 20,),




                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Powered by",style: getstyle(10, FontWeight.normal, textcolor),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 23,
                          width: 23,

                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(Icons.search,color: Colors.white,),
                        ),
                        SizedBox(width: 5,),
                        Text("Technominds",style: getstyle(13, FontWeight.normal, textcolor),)
                      ],
                    ),
                    SizedBox(height: 15,)
                  ],
                ),
              )
            ],

          ),
        ),
      ),
    );
  }

  TextFormField buildphoneFormField() {
    return TextFormField(

      onSaved: (newValue) => phone = newValue!,
      controller: _phone,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Phone Number';
        }

        if(value.length<10){
          return 'Invalid Phone Number';
        }
        return null;
      },
      cursorColor: Colors.grey,
      style: TextStyle(color:Colors.grey,fontSize: 15),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder:InputBorder.none,
        focusColor: c1,
        hintStyle: getstyle(15, FontWeight.normal, Colors.grey),
        hintText: "Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }
}
