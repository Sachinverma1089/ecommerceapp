import 'package:ecommerceapp/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final void Function()? onTap;
  final String? label;
  const CheckoutButton({super.key, this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
            padding: EdgeInsets.all(0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                    child: Text(label!,
                        style: appstyle(20, Colors.white, FontWeight.bold))))));
  }
}
