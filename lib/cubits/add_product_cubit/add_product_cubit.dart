import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_store_app/cubits/add_product_cubit/add_product_cubit_status.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/services/add_product_service.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(IntialAddProduct());
  // bool isLoading = false;
  addProduct(ProductModel product) async {
    try {
      debugPrint("add product cubit");
      // isLoading = true;
      // print(isLoading);
      emit(LoadingAddProduct());
      debugPrint("add product cubit loading");
      await AddProductService().addProduct(product);
      // isLoading = true;
      debugPrint("add product cubit waitted");
      emit(SuccessAddProduct());
    } catch (error) {
      // isLoading = false;
      debugPrint(error.toString());
      emit(FailureAddProduct(error.toString()));
    }
  }
}
