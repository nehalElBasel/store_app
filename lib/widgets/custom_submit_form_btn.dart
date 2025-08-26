import 'package:flutter/material.dart';
import 'package:simple_store_app/helper.dart';

class CustomSubmitFormBtn extends StatelessWidget {
  const CustomSubmitFormBtn({super.key, this.onPressed, this.title = "Save"});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: submitFormBtnStyle(),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
