import 'dart:convert';

import 'package:StayFloripa/components/main_house_component.dart';
import 'package:StayFloripa/models/house_model.dart';
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
  HouseDetailsModel selectedHouse = HouseDetailsModel();
  bool shouldRenderMainHouse = true;

  getHouses() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    List<HouseDetailsModel> housesFormatted = [];
    for (var element in data) {
      housesFormatted.add(HouseDetailsModel.fromJson(element));
    }

    setState(() {
      houses = housesFormatted;
      selectedHouse = housesFormatted[0];
    });
  }

  AssetImage getHouseImage(dynamic h) {
    return AssetImage('assets/images/${h['id']}.png');
  }

  @override
  initState() {
    getHouses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWith = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StayFloripa.",
          style: GoogleFonts.merriweather(),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                      labelText: 'Busque por uma casa',
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: deviceHeight * 0.03),
                Text(
                  "Recomendadas",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: deviceHeight * 0.01),
                if (shouldRenderMainHouse) MainHouseComponent(house: houses[0]),
                SizedBox(height: deviceHeight * 0.06),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
