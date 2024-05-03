import "package:flutter/material.dart";

class UiHelper {
  static customTextFormField(
      TextEditingController controller, String text, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
        ),
      ),
    );
  }

  static customSnackBar(
      int seconds, BuildContext context, {required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: seconds),
      ),
    );
  }
}
