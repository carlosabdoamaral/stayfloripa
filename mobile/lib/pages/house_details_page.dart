import 'package:stay_floripa/components/price_overlay_component.dart';
import 'package:stay_floripa/models/house_model.dart';
import 'package:stay_floripa/pages/rent_house_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

    String getPhoneFormatted() {
      String phone = widget.house.contact!.phone!;
      String country = phone.substring(0, 2);
      String ddd = phone.substring(2, 4);

      String first = phone.substring(5, 9);
      String second = phone.substring(9);
      return "+$country $ddd $first-$second";
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
              color: const Color.fromARGB(255, 17, 21, 91),
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.justify,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Endereço",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 17, 21, 91),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  widget.house.location!.address!,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
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
                          'assets/images/${widget.house.id}.png',
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
          priceOverlayComponent(widget.house),
        ],
      );
    }

    Widget buildRulesList(
      String? label,
      Widget? customLabel,
      List<String> rules,
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          if (customLabel != null) customLabel,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var rule in rules)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Text(rule),
                  ),
              ],
            ),
          ),
        ],
      );
    }

    Widget buildRulesSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Regras",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 17, 21, 91),
            ),
          ),
          if (widget.house.rules!.during!.list!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRulesList(
                  "Durante a estadia",
                  null,
                  widget.house.rules!.during!.list!,
                ),
                SizedBox(height: deviceHeight * 0.03),
              ],
            ),
          if (widget.house.rules!.during!.forbidden!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRulesList(
                  null,
                  Text(
                    "É importante lembrar",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  widget.house.rules!.during!.forbidden!,
                ),
                SizedBox(height: deviceHeight * 0.03),
              ],
            ),
          if (widget.house.rules!.beforeLeaving!.list!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRulesList(
                  "Antes de sair",
                  null,
                  widget.house.rules!.beforeLeaving!.list!,
                ),
                SizedBox(height: deviceHeight * 0.03),
              ],
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
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: deviceHeight * 0.1,
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

                    buildRulesSection()
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
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
                  height: deviceHeight * 0.9,
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
