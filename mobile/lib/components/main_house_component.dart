import 'package:StayFloripa/models/house_model.dart';
import 'package:StayFloripa/pages/house_details_page.dart';
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/1.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.house.title!,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            widget.house.description!,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  print("Detalhes");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HouseDetailsPage(
                        house: widget.house,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Ver detalhes",
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 9, 12, 90),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 9, 12, 90),
                ),
                onPressed: () {
                  print("Alugar");
                },
                child: Text(
                  "Alugar",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
