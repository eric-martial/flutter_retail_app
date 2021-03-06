import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage({this.title, this.imageUrl});

  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure?"),
          content: Text("this action will permanently delete this item"),
          actions: <Widget>[
            FlatButton(
              child: Text("Discard"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Delete"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print("back button pressed");
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text("You are on the product detail page"),
              ),
              Container(
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("Delete"),
                  onPressed: () => _showWarningDialog(context),
                ),
              )
            ],
          )),
        ));
  }
}
