import 'package:flutter/material.dart';
import 'package:untitled2/Entites/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TopList extends StatelessWidget {
  List<product> products = [];

  Future<void> getAllProducts() async {
    var url = "http://192.168.100.8:3000/products";

    await http.get(Uri.parse(url)).then((response) {
      print(response.statusCode);

      if (response.statusCode == 200) {
        List getproducts = convert.jsonDecode(response.body);
        if (getproducts.length > 0) {
          for (int i = 0; i < getproducts.length; i++) {
            products.add(new product(
                title: getproducts[i]['title'],
                img_url: getproducts[i]['img_url'],
                price: getproducts[i]['price']));
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {

getAllProducts();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "محصولات جدید",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                  child: Text(
                "نمایش همه >",
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.left,
              )),
            ],
          ),
        ),
        products.length > 0
            ? Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(products[index].img_url),
                              ),
                            ),
                            Text(products[index].title),
                            Container(
                                width: 250,
                                alignment: Alignment.centerLeft,
                                color: Colors.red,
                                child: Text(products[index].price.toString()))
                          ],
                        ),
                      );
                    }),
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
                height: 250,
              )
      ],
    );
  }
}
//   TopList()
// {
//
//
// }
