import 'package:flutter/material.dart';

class CustomTextfeild extends StatelessWidget {
  final String hint;
  final bool visible;
  final TextEditingController textEditingController;
  const CustomTextfeild(
      {super.key, required this.hint, required this.textEditingController,required this.visible});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        controller: textEditingController,
        cursorColor: Theme.of(context).colorScheme.onSurface,
        obscureText: visible,
        decoration:  InputDecoration(

            hintText: hint,
            contentPadding:const  EdgeInsets.all(5),
            filled: false,
            border: InputBorder.none),
      ),
    );
  }
}
