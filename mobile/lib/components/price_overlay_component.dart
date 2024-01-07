import 'package:StayFloripa/common/currency.dart';
import 'package:StayFloripa/models/house_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget PriceOverlayComponent(HouseDetailsModel house) {
  return Container(
    margin: const EdgeInsets.only(left: 10, top: 10),
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    decoration: BoxDecoration(
      color: Colors.black45,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      getHousePriceFormatted(house),
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
