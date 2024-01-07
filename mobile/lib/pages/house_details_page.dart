import 'package:StayFloripa/components/key_value_component.dart';
import 'package:StayFloripa/models/house_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HouseDetailsPage extends StatefulWidget {
  const HouseDetailsPage({super.key, required this.house});

  final HouseDetailsModel house;

  @override
  State<HouseDetailsPage> createState() => _HouseDetailsPageState();
}

class _HouseDetailsPageState extends State<HouseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    String getPhoneFormatted() {
      String phone = widget.house.contact!.phone!;
      String country = phone.substring(0, 2);
      String ddd = phone.substring(2, 4);

      String first = phone.substring(5, 9);
      String second = phone.substring(9);
      return "+$country $ddd $first-$second";
    }

    String getAmountFormatted() {
      double amount = widget.house.price!;
      var formatter = NumberFormat.currency(locale: 'pt_BR', symbol: '\$');
      String result = formatter.format(amount);
      return result;
    }

    Widget buildSection(String title, dynamic description) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 17, 21, 91),
            ),
          ),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ],
      );
    }

    Widget buildContactSection() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey[300]!, width: 1),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.house.contact!.name!,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "${getPhoneFormatted()} · ${widget.house.contact!.email!}",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    Widget buildTitleSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.house.title!,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "${widget.house.maxGuests} hóspedes · ${widget.house.count!.bedrooms} quartos · ${widget.house.count!.beds} camas · ${widget.house.count!.bathrooms} banheiros",
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      );
    }

    Widget buildAddressSection() {
      return Row(
        children: [
          buildSection(
            "Endereço",
            widget.house.location!.address!,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(255, 17, 21, 91).withOpacity(0.1),
            ),
            child: const Icon(
              Icons.location_on,
              color: Color.fromARGB(255, 17, 21, 91),
            ),
          )
        ],
      );
    }

    Widget buildCarouselSection() {
      return Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.2,
              aspectRatio: 4 / 3,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(
                seconds: 3,
              ),
              autoPlayAnimationDuration: const Duration(
                seconds: 1,
              ),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: [1, 2, 3].map(
              (h) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/1.png',
                          fit: BoxFit.cover,
                          height: deviceHeight * 0.2,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
          Container(
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
              getAmountFormatted(),
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes",
          style: GoogleFonts.merriweather(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCarouselSection(),
                    SizedBox(height: deviceHeight * 0.02),

                    buildTitleSection(),
                    SizedBox(height: deviceHeight * 0.02),

                    buildContactSection(),
                    SizedBox(height: deviceHeight * 0.03),

                    // Endereço
                    buildAddressSection(),
                    SizedBox(height: deviceHeight * 0.03),

                    // Descrição
                    buildSection("Descrição", widget.house.description!),
                    SizedBox(height: deviceHeight * 0.03),

                    // O espaço
                    buildSection("Espaço", widget.house.about!.space!),
                    SizedBox(height: deviceHeight * 0.03),

                    // Acesso
                    buildSection("Acesso", widget.house.about!.access!),
                    SizedBox(height: deviceHeight * 0.03),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: deviceHeight * 0.8,
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 7, 15, 82),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Solicitar reserva!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
