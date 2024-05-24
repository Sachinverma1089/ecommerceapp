import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class StaggerTile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String price;
  const StaggerTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});
  _StaggerTileState createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 12),
                height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appstyleWithHeight(
                          20, Colors.black, FontWeight.w700, 1),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.price,
                      style: appstyleWithHeight(
                          20, Colors.black, FontWeight.w700, 0.5),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
