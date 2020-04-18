import 'package:flutter/material.dart';
import 'package:project_akhir_app/services/http_service.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List products;
  var _isLoading = true;

  getProduct() async {
    List result = await HttpService().getProducts();
    setState(() {
      products = result;
      _isLoading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    getProduct();
  }

  Future<void> refresh(){
    return getProduct();
  }

  @override
  Widget build(BuildContext context){
    return Container(
        height: 400,
        child: _isLoading ?
        Container(
          height: 200,
          child: Center(child: CircularProgressIndicator(),),)
            : RefreshIndicator(
            onRefresh: refresh,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(itemBuilder: (context,index){
                    return products == null ?
                    Container()
                        : ListTile(
                      title: Text(products[index]['title']),
                      subtitle: Text(products[index]['description']),
                      trailing: Text(products[index]['price'].toString()),
                    );
                  },
                    itemCount: products==null?0: products.length,
                  ),
                )
              ],
            ),)
    );
  }
}
