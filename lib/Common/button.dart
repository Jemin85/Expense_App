import 'package:flutter/material.dart';

class Common {
  ElevatedButton elevatedButton(
      text, textcolor, primarycolor, Function() func) {
    return ElevatedButton(
        child: Text(text, style: TextStyle(color: textcolor)),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: primarycolor,
            padding: const EdgeInsets.symmetric(vertical: 20)),
        onPressed: () {
          func();
        });
  }

  FormField textFormField(controller, textInputAction, textInputType, text) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        hintText: text, //'Description',
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
