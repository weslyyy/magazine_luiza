import 'package:flutter/material.dart';
import 'package:magazine_luiza/model/product.dart';
import 'package:magazine_luiza/provider/products.dart';
import 'package:magazine_luiza/style.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/logo.jpg",
          ),
        ),
        title: Text(
          "Ofertas do dia",
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          Product product = products.elementAt(index);
          return ListTile(
            leading: Image.asset(
              product.photo,
            ),
            trailing: IconButton(
              icon: (product.isFavorite)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () {
                setState(() {
                  product.isFavorite = !product.isFavorite;
                });
              },
              color: redTheme,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "R\$ ${product.price}",
                  style: TextStyle(
                    fontSize: 13,
                    color: blueTheme.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "${product.installments}x de R\$ ${product.installmentsValue} ${product.interest}",
                  style: TextStyle(
                    fontSize: 10,
                    color: blueTheme,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: products.length,
      ),
    );
  }
}
