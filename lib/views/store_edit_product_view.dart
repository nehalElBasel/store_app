import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simple_store_app/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:simple_store_app/cubits/add_product_cubit/add_product_cubit_status.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/text_constants.dart';
import 'package:simple_store_app/widgets/store_edit_product_body.dart';

class StoreEditProductView extends StatelessWidget {
  const StoreEditProductView({super.key});

  static final editProductPageRoute = kEditProductRouteID;
  @override
  Widget build(BuildContext context) {
    // final bool _isLoading = BlocProvider.of<AddProductCubit>(context).isLoading;
    return Scaffold(
      appBar: AppBar(title: Text("edit new product"), centerTitle: true),
      body: BlocProvider(
        create: (context) => AddProductCubit(),
        child: BlocConsumer<AddProductCubit, AddProductStates>(
          builder: (context, state) {
            print("build again ${state}");

            return ModalProgressHUD(
              inAsyncCall: state is LoadingAddProduct,
              child: StoreEditProductBody(
                product:
                    ModalRoute.settingsOf(context)!.arguments as ProductModel,
              ),
            );
          },
          listener: (context, state) {
            if (state is FailureAddProduct) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(minutes: 1),
                  content: Text(state.errorMessage),
                ),
              );
            } else if (state is SuccessAddProduct) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(minutes: 1),
                  content: Text(kAddProductSuccessMessage),
                ),
              );
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
