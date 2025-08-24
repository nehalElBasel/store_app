import 'package:flutter/material.dart';
import 'package:simple_store_app/models/product_model.dart';

class StoreHomeCard extends StatelessWidget {
  const StoreHomeCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title.substring(0, 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ ${product.price}"),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -40,
          right: 40,
          child: Image.network(width: 100, height: 100, product.image),
        ),
      ],
    );
  }
}
