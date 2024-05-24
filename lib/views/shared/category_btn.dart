import 'package:ecommerceapp/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({super.key, this.onPressed, this.buttonClr, this.label});
  final void Function()? onPressed;
  final Color? buttonClr;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: buttonClr!, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            label!,
            style: appstyle(20, buttonClr!, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
