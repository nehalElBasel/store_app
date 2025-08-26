import 'package:flutter/material.dart';
import 'package:simple_store_app/text_constants.dart';
import 'package:simple_store_app/widgets/store_add_product_body.dart';

class StoreAddProductView extends StatelessWidget {
  const StoreAddProductView({super.key});

  static final addProductPageRoute = kAddProductRouteID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new product"), centerTitle: true),
      body: StoreAddProductBody(),
    );
  }
}
