import 'package:flutter/material.dart';
import 'package:simple_store_app/color_constants.dart';

InputBorder textFormBorderDecoration() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: kTextBorderColor),
  );
}

TextStyle textFormHintStyle() {
  return TextStyle(
    color: kTextHintColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}

ButtonStyle submitFormBtnStyle() {
  return ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
    backgroundColor: WidgetStatePropertyAll(kSubmitFormBtnColor),
    foregroundColor: WidgetStatePropertyAll(kSubmitFormBtnTextColor),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    ),
  );
}
