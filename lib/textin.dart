import 'package:flutter/material.dart';

class TIn extends StatefulWidget {
  final Function(String) callb;

  TIn(this.callb);
  
  @override
  _TInState createState() => _TInState();
}

class _TInState extends State<TIn> {
  final controller = TextEditingController();
 
  @override
  void dispose(){
    super.dispose();
    controller.dispose();

  }
  void click(){
    widget.callb(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }
  



  @override
  Widget build(BuildContext context) {
    return 
      TextField(controller: this.controller, decoration: InputDecoration(prefixIcon: Icon(Icons.message),
      suffixIcon: IconButton(icon: Icon(Icons.send), 
      splashColor: Colors.green, 
      onPressed: this.click),
      labelText: "type here"));
  }
}