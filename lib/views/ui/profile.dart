import 'package:ecommerceapp/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is Profile",
          style: appstyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
