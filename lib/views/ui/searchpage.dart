import 'package:ecommerceapp/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is SearchPage",
          style: appstyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
