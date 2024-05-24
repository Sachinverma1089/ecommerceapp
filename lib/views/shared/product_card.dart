import 'package:community_material_icon/community_material_icon.dart';
import 'package:ecommerceapp/controllers/favorites_provider.dart';
import 'package:ecommerceapp/models/constants.dart';
import 'package:ecommerceapp/views/shared/appstyle.dart';
import 'package:ecommerceapp/views/ui/favorites.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    this.price,
    this.category,
    this.id,
    this.name,
    this.image,
  });

  final String? price;
  final String? category;
  final String? id;
  final String? name;
  final String? image;
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var favoritesNotifier =
        Provider.of<FavoritesNotifier>(context, listen: true);
    favoritesNotifier.getFavorites();
    bool selected = true;
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1))
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.image!,
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: GestureDetector(
                          onTap: () async {
                            if (favoritesNotifier.ids.contains(widget.id)) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Favorites()));
                            } else {
                              favoritesNotifier.createFav({
                                "id": widget.id,
                                "name": widget.name,
                                "category": widget.category,
                                "price": widget.price,
                                "imageUrl": widget.image
                              });
                            }
                            setState(() {});
                          },
                          child: favoritesNotifier.ids.contains(widget.id)
                              ? Icon(AntDesign.heart_fill)
                              : Icon(AntDesign.heart_outline),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name!,
                      style: appstyleWithHeight(
                          36, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      widget.category!,
                      style: appstyleWithHeight(
                          18, Colors.grey, FontWeight.bold, 1.5),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price!,
                      style: appstyle(25, Colors.black, FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          "Colors",
                          style: appstyle(15, Colors.grey, FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          label: Text(""),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Colors.grey,
                        )
                      ],
                    )
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
