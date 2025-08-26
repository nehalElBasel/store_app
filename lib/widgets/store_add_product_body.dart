import 'package:flutter/material.dart';
import 'package:simple_store_app/widgets/custom_text_form_feild.dart';
import 'package:simple_store_app/widgets/custom_submit_form_btn.dart';

class StoreAddProductBody extends StatefulWidget {
  const StoreAddProductBody({super.key});

  @override
  State<StoreAddProductBody> createState() => _StoreAddProductBodyState();
}

class _StoreAddProductBodyState extends State<StoreAddProductBody> {
  late TextEditingController titleController,
      priceController,
      describtionController;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    describtionController = TextEditingController();
    priceController = TextEditingController();
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
    print("pressed");
    if (formKey.currentState!.validate()) {
      print("yes");
      print(titleController.text);
      print(priceController.text);
      print(describtionController.text);
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
