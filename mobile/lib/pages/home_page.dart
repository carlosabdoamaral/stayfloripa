import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stay_floripa/components/main_house_component.dart';
import 'package:stay_floripa/models/house_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HouseDetailsModel> houses = [];
  List<HouseDetailsModel> housesShowing = [];
  HouseDetailsModel? mainHouse;
  bool shouldRenderMainHouse = true;

  TextEditingController searchTextController = TextEditingController();

  getHouses() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    List<HouseDetailsModel> housesFormatted = [];
    for (var element in data) {
      housesFormatted.add(HouseDetailsModel.fromJson(element));
    }

    setState(() {
      houses = housesFormatted;
      housesShowing = housesFormatted;
      mainHouse = housesFormatted[0];
    });
  }

  Image getHouseImage(HouseDetailsModel house) {
    return Image.asset(house.images![0]);
  }

  @override
  initState() {
    getHouses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    String formatString(String str) {
      var comAcento =
          'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
      var semAcento =
          'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

      for (int i = 0; i < comAcento.length; i++) {
        str = str.replaceAll(comAcento[i], semAcento[i]);
      }

      return str.toUpperCase();
    }

    bool stringContains(String findInString, String searchString) {
      return formatString(findInString).contains(formatString(searchString));
    }

    Widget buildSearchBar() {
      return TapRegion(
        onTapOutside: (event) => {FocusScope.of(context).unfocus()},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: searchTextController,
            onChanged: (value) {
              setState(
                () {
                  housesShowing = houses
                      .where(
                        (element) =>
                            stringContains(element.title!, value) ||
                            stringContains(element.description!, value) ||
                            //
                            stringContains(element.location!.address!, value) ||
                            //
                            stringContains(element.contact!.name!, value) ||
                            stringContains(element.contact!.email!, value) ||
                            stringContains(element.contact!.phone!, value) ||
                            //
                            stringContains(
                                element.maxGuests.toString(), value) ||
                            //
                            stringContains(element.about!.access!, value) ||
                            stringContains(element.about!.notes!, value) ||
                            stringContains(element.about!.space!, value),
                      )
                      .toList();
                },
              );
            },
            decoration: const InputDecoration(
              labelText: 'Busque por uma casa',
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StayFloripa.",
          style: GoogleFonts.merriweather(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              constraints: BoxConstraints(
                minHeight: deviceHeight * 0.7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSearchBar(),
                  SizedBox(height: deviceHeight * 0.03),
                  for (var house in housesShowing)
                    MainHouseComponent(
                      house: house,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
