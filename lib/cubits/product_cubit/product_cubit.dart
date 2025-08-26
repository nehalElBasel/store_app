import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_store_app/cubits/product_cubit/product_cubit_status.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/services/add_product_service.dart';
import 'package:simple_store_app/services/update_product_service.dart';

class ProductCubit extends Cubit<AddProductStates> {
  ProductCubit() : super(IntialProduct());
  // bool isLoading = false;
  addProduct(ProductModel product) async {
    try {
      debugPrint("add product cubit");
      // isLoading = true;
      // print(isLoading);
      emit(LoadingProduct());
      debugPrint("add product cubit loading");
      await AddProductService().addProduct(product);
      // isLoading = true;
      debugPrint("add product cubit waitted");
      emit(SuccessProduct());
    } catch (error) {
      // isLoading = false;
      debugPrint(error.toString());
      emit(FailureProduct(error.toString()));
    }
  }

  editProduct(ProductModel product) async {
    try {
      debugPrint("edit product cubit");
      // isLoading = true;
      // print(isLoading);
      emit(LoadingProduct());
      debugPrint("edit product cubit loading");
      await UpdateProductService().updateProduct(product);
      // isLoading = true;
      debugPrint("update product cubit waitted");
      emit(SuccessProduct());
    } catch (error) {
      // isLoading = false;
      debugPrint(error.toString());
      emit(FailureProduct(error.toString()));
    }
  }
}
