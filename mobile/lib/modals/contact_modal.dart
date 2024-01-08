import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stay_floripa/common/contact.dart';
import 'package:stay_floripa/common/phone.dart';
import 'package:stay_floripa/models/house_model.dart';

class ContactModal extends StatefulWidget {
  const ContactModal({super.key, required this.house});

  final HouseDetailsModel house;

  @override
  State<ContactModal> createState() => _ContactModalState();
}

class _ContactModalState extends State<ContactModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contato",
          style: GoogleFonts.merriweather(),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              sendMessage(
                widget.house.contact!.phone!,
                "Olá ${widget.house.contact!.name}! Gostaria de falar sobre o imóvel ${widget.house.title}",
              );
            },
            child: ListTile(
              title: Text(
                getPhoneFormatted(widget.house.contact!.phone!),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                ),
              ),
              leading: const Icon(Icons.phone),
            ),
          ),
          GestureDetector(
            onTap: () {
              sendEmail(
                widget.house.contact!.email!,
                "Olá ${widget.house.contact!.name}! Gostaria de falar sobre o imóvel ${widget.house.title}",
                "",
              );
            },
            child: ListTile(
              title: Text(
                widget.house.contact!.email!,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                ),
              ),
              leading: const Icon(Icons.mail),
            ),
          ),
        ],
      ),
    );
  }
}
