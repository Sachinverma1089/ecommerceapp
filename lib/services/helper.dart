import 'package:ecommerceapp/models/sneaker_model.dart';
import 'package:flutter/services.dart' as the_bundle;

// this class fetches data from the json file and return it to the app
class Helper {
  // Male
  Future<List<Sneakers>> getMaleSneaker() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final maleList = sneakersFromJson(data);

    return maleList;
  }

  // Female
  Future<List<Sneakers>> getFemaleSneaker() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final femaleList = sneakersFromJson(data);

    return femaleList;
  }

  // Kids
  Future<List<Sneakers>> getkidsSneaker() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final kidsList = sneakersFromJson(data);

    return kidsList;
  }

  //Single Male

  Future<Sneakers> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single Female

  Future<Sneakers> getFemaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final femaleList = sneakersFromJson(data);

    final sneaker = femaleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single kid

  Future<Sneakers> getkidsSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final kidList = sneakersFromJson(data);

    final sneaker = kidList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }
}
