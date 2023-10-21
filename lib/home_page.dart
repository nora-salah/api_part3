import 'package:flutter/material.dart';
import 'package:statemangement/count2.dart';

import 'count1.dart';


class DashBoard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 400,
        width: 400,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DashBoard",
                style: TextStyle(fontSize: 60, ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  count1(),
                  SizedBox(
                    width: 10,
                  ),
                  count2(),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
