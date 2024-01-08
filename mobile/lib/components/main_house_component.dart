import 'package:stay_floripa/components/price_overlay_component.dart';
import 'package:stay_floripa/models/house_model.dart';
import 'package:stay_floripa/pages/house_details_page.dart';
import 'package:stay_floripa/pages/rent_house_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHouseComponent extends StatefulWidget {
  const MainHouseComponent({super.key, required this.house});

  final HouseDetailsModel house;

  @override
  State<MainHouseComponent> createState() => _MainHouseComponentState();
}

class _MainHouseComponentState extends State<MainHouseComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.house.images![0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              priceOverlayComponent(widget.house),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.house.title!,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            widget.house.description!,
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HouseDetailsPage(
                        house: widget.house,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Ver detalhes",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 9, 12, 90),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RentHousePage(
                        house: widget.house,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 9, 12, 90),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Reservar",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}