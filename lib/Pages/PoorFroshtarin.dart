

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:untitled2/Entites/Product.dart';

class Poorfroshtarin extends StatefulWidget {
  const Poorfroshtarin({super.key});

  @override
  State<Poorfroshtarin> createState() => _PoorfroshtarinState();
}

class _PoorfroshtarinState extends State<Poorfroshtarin> {
  List<product> Products = [];

  Future<void> getAllProducts() async {
    var url = "http://192.168.100.8:3000/poorfroshtarin";

    await http.get(Uri.parse(url)).then((response) {



      if (response.statusCode == 200) {
        List GetAllProducts = convert.jsonDecode(response.body);

        for (int i = 0; i < GetAllProducts.length; i++) {
          Products.add(new product(
              title: GetAllProducts[i]['title'],
              img_url: GetAllProducts[i]['img_url'],
              price: GetAllProducts[i]['price']));
        }


      } else {
        print(response.statusCode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    var s=getAllProducts();
    print(s);


    return Container(
      height: 290,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  "پر فروشترین",
                  style: TextStyle(color: Colors.grey),
                )),
                Expanded(
                    child: Text(
                  "نمایش همه",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.red),
                ))
              ],
            ),
            Products.length > 0
                ? Container(
              height: 230,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            children: [
                              Image.network(Products[index].img_url,width: 200,height: 150,),
                              Text(Products[index].title),
                              Text(Products[index].price.toString())
                            ],
                          );

                      }),
                )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                    height: 290,
                  )
          ],
        ),
      ),
    );
  }
}
