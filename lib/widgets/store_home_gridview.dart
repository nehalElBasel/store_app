import 'package:flutter/material.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/widgets/store_home_card.dart';

class StoreHomeGridView extends StatelessWidget {
  const StoreHomeGridView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: GridView.builder(
        itemCount: products.length,
        clipBehavior: Clip.none,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 70,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (ctx, index) => StoreHomeCard(product: products[index]),
      ),
    );
  }
}
