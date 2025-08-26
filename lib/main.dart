import 'package:flutter/material.dart';
import 'package:simple_store_app/views/store_add_product_view.dart';
import 'package:simple_store_app/views/store_edit_product_view.dart';
import 'package:simple_store_app/views/store_home_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Store App',
      routes: {
        StoreHomeView.storeVieID: (context) => StoreHomeView(),
        StoreAddProductView.addProductPageRoute:
            (context) => StoreAddProductView(),
        StoreEditProductView.editProductPageRoute:
            (context) => StoreEditProductView(),
      },

      initialRoute: StoreHomeView.storeVieID,
    );
  }
}
