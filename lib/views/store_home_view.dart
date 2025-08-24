import 'package:flutter/material.dart';
import 'package:simple_store_app/services/get_products_service.dart';
import 'package:simple_store_app/widgets/store_home_gridview.dart';

class StoreHomeView extends StatelessWidget {
  const StoreHomeView({super.key});

  static final storeVieID = "store";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Trend"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shop_2))],
      ),
      body: FutureBuilder(
        future: GetProductsService().getProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return StoreHomeGridView(products: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
