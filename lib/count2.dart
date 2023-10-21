import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_provider.dart';

class count2 extends StatelessWidget {
  //const count2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        height: 150,
        width: 150,
        child: Center(
          child: Text(
            Provider.of<MyProvider>(context).counter.toString(),
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
