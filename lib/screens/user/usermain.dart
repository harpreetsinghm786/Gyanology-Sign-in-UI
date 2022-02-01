import 'package:flutter/material.dart';

class Usermain extends StatefulWidget {
  const Usermain({Key? key}) : super(key: key);

  @override
  _UsermainState createState() => _UsermainState();
}

class _UsermainState extends State<Usermain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("data"
          ),
        ),
      ),
    );
  }
}
