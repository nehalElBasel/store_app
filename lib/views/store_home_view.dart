import 'package:flutter/material.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/services/get_products_service.dart';
import 'package:simple_store_app/widgets/store_home_gridview.dart';

class StoreHomeView extends StatefulWidget {
  const StoreHomeView({super.key});

  static final storeVieID = "store";

  @override
  State<StoreHomeView> createState() => _StoreHomeViewState();
}

class _StoreHomeViewState extends State<StoreHomeView> {
  late Future<List<ProductModel>> _future;
  @override
  void initState() {
    super.initState();
    _future = getProducts();
  }

  Future<List<ProductModel>> getProducts() async {
    return await GetProductsService().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Trend"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shop_2))],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _future,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return StoreHomeGridView(products: snapshot.data!);
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(snapshot.error.toString())),
              );
            });
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
