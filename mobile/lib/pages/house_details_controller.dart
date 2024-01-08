import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stay_floripa/models/house_model.dart';
import 'package:stay_floripa/pages/house_details_gallery_page.dart';
import 'package:stay_floripa/pages/house_details_page.dart';

class HouseDetailsPageController extends StatefulWidget {
  const HouseDetailsPageController({super.key, required this.house});
  final HouseDetailsModel house;

  @override
  State<HouseDetailsPageController> createState() =>
      _HouseDetailsPageControllerState();
}

class _HouseDetailsPageControllerState
    extends State<HouseDetailsPageController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Detalhes",
            style: GoogleFonts.merriweather(),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 9, 12, 90),
            tabs: [
              Tab(
                text: "Detalhes",
              ),
              Tab(
                text: "Galeria",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HouseDetailsPage(house: widget.house),
            HouseDetailsGalleryPage(house: widget.house)
          ],
        ),
      ),
    );
  }
}
