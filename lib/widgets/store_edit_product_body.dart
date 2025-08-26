import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_store_app/bloc_observer.dart';
import 'package:simple_store_app/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:simple_store_app/models/product_model.dart';
import 'package:simple_store_app/widgets/custom_text_form_feild.dart';
import 'package:simple_store_app/widgets/custom_submit_form_btn.dart';

class StoreEditProductBody extends StatefulWidget {
  const StoreEditProductBody({super.key, required this.product});
  final ProductModel product;

  @override
  State<StoreEditProductBody> createState() => _StoreAddProductBodyState();
}

class _StoreAddProductBodyState extends State<StoreEditProductBody> {
  late TextEditingController titleController,
      priceController,
      describtionController;

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Bloc.observer = OurObserver();
    titleController = TextEditingController(text: widget.product.title);
    describtionController = TextEditingController(
      text: widget.product.price.toString(),
    );
    priceController = TextEditingController(text: widget.product.describtion);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    describtionController.dispose();
    priceController.dispose();
  }

  void _onpressed() {
    if (formKey.currentState!.validate()) {
      ProductModel product = ProductModel(
        id: DateTime.timestamp().microsecond,
        title: titleController.text,
        price: double.tryParse(priceController.text) ?? 0,
        describtion: describtionController.text,
        category: "electronic",
        image: "https://i.pravatar.cc",
      );

      BlocProvider.of<AddProductCubit>(context).addProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormFeild(
              hint: "Name:",
              keyboardType: TextInputType.text,
              controller: titleController,
            ),
            CustomTextFormFeild(
              hint: "Price:",
              keyboardType: TextInputType.number,
              controller: priceController,
            ),
            CustomTextFormFeild(
              hint: "Describtion:",
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              controller: describtionController,
            ),
            CustomSubmitFormBtn(title: "Submit", onPressed: _onpressed),
          ],
        ),
      ),
    );
  }
}
