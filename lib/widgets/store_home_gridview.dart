import 'package:flutter/material.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/views/store_edit_product_view.dart';
import 'package:simple_store_app/widgets/store_home_card.dart';

class StoreHomeGridView extends StatelessWidget {
  const StoreHomeGridView({super.key, required this.products});
  final List<ProductModel> products;

  void _onCardTab(BuildContext context, ProductModel product) {
    Navigator.of(
      context,
    ).pushNamed(StoreEditProductView.editProductPageRoute, arguments: product);
  }

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
        itemBuilder:
            (ctx, index) => StoreHomeCard(
              product: products[index],
              onTap: () {
                _onCardTab(context, products[index]);
              },
            ),
      ),
    );
  }
}
