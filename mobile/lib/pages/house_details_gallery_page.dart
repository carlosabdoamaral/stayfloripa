import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stay_floripa/models/house_model.dart';

class HouseDetailsGalleryPage extends StatefulWidget {
  const HouseDetailsGalleryPage({super.key, required this.house});

  final HouseDetailsModel house;

  @override
  State<HouseDetailsGalleryPage> createState() =>
      _HouseDetailsGalleryPageState();
}

class _HouseDetailsGalleryPageState extends State<HouseDetailsGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          for (var img in widget.house.images!)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
