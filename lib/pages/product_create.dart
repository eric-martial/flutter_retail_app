import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: RaisedButton(
      child: Text("Create"),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: Text("Some text"),
            );
          }
        );
      },
    ),);
  }
}