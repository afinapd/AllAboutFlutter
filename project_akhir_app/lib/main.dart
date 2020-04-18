import 'package:flutter/material.dart';
import 'package:project_akhir_app/widgets/product_list.dart';

import 'widgets/product_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title = 'apaan';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showProductForm() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: ProductForm(),
          );
        });}

bool showProductList = false;

  getProduct(){
    setState(() {
      showProductList = true;
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Product'),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: showProductForm,
                      ),
                      IconButton(
                        icon: Icon(Icons.widgets),
                        onPressed: getProduct,
                      )
                    ],
                  )
                ],
              ),
              showProductList? ProductList() : Container()
            ],
          ),
        )
      );
    }}