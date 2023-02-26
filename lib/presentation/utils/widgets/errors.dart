import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String? message;
  ErrorMessage({this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          color: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: MediaQuery.of(context).size.width * 0.1,color: Colors.grey,),
              Text(message!, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03,color: Colors.grey),maxLines: 3,),
            ],
          ),
        ),
      ),
    );
    //return Text('$message');
  }
}