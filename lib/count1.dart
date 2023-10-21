import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_provider.dart';

class count1 extends StatelessWidget {
  //const count1({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      child: Container(
        height: 150,
        width: 150,
        child: Center(
          child: Text(
            '${Provider.of<MyProvider>(context,listen: false).counter}',
            style:
            TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
