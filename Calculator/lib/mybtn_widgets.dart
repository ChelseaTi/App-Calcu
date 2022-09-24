import 'package:flutter/material.dart';

 class BtnWidgets extends StatefulWidget{

  BtnWidgets{
    (required this.buttonColor,
    required this.buttonText,
  required this.buttonTextColor,
  this.onPressed)};

  Color buttonColor;
  String buttonText;
  Color buttonTextColor;

  final VoidCallback ? onPressed;
  @override
  _BtnWidgets createState() => _BtnWidgets();
}

  class _BtnWidgets extends State<BtnWidgets>{
   @override
    Widget build(BuildContext context){
     return GestureDetector(
       onTap: widget.onPressed,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
         decoration: BoxDecoration(
           color: widget.buttonColor,
           borderRadius: BorderRadius.circular(20),
         )
             child: Center(
             child: Text(widget.buttonText, style: TextStyle(
              child: widget.buttonTextColor, fontWeight: FontWeight.bold,
                      fontSize: 20,
     ))
     )
     ),
       );
   }
  }
