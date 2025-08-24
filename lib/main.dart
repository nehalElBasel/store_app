import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      routes: {StoreHomeView.storeVieID: (context) => StoreHomeView()},
      initialRoute: StoreHomeView.storeVieID,
    );
  }
}
