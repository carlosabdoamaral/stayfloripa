import 'package:stay_floripa/common/date.dart';
import 'package:stay_floripa/components/key_value_component.dart';
import 'package:stay_floripa/models/house_model.dart';
import 'package:stay_floripa/services/rent.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RentHousePage extends StatefulWidget {
  const RentHousePage({super.key, required this.house});

  final HouseDetailsModel house;
  @override
  State<RentHousePage> createState() => _RentHousePageState();
}

class _RentHousePageState extends State<RentHousePage> {
  DateTimeRange selectedDateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  double finalAmount = 0;
  TextEditingController guestCount = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController name = TextEditingController();

  bool canRunConstructor = true;

  final rentService = RentService();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    String getAmountFormatted(double amount) {
      var formatter = NumberFormat.currency(locale: 'pt_BR', symbol: '\$');
      String result = formatter.format(amount);
      return result;
    }

    void resolveFinalAmount() {
      int days = selectedDateRange.duration.inDays;

      if (days == 0) {
        days = 1;
      }

      double res = days * widget.house.price!;

      setState(() {
        finalAmount = res;
      });
    }

    Future<void> selectDateRange(BuildContext context) async {
      final DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        initialDateRange: selectedDateRange,
      );

      if (picked != null && picked != selectedDateRange) {
        setState(() {
          selectedDateRange = picked;
          resolveFinalAmount();
        });
      }
    }

    Widget buildCheckInOutSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              KeyValueComponent(
                label: "Check-in",
                value: formatDate(selectedDateRange.start),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.black,
              ),
              const SizedBox(width: 10),
              KeyValueComponent(
                label: "Check-out",
                value: formatDate(selectedDateRange.end),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              KeyValueComponent(
                label: "Valor final",
                value: finalAmount == 0
                    ? "Informe o check-in e check-out"
                    : getAmountFormatted(finalAmount),
              ),
            ],
          ),
        ],
      );
    }

    Widget buildGuestNumberSection() {
      return TapRegion(
        onTapOutside: (event) => {FocusScope.of(context).unfocus()},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            initialValue: guestCount.text,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                guestCount.text = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Número de hóspedes',
              labelStyle: GoogleFonts.poppins(fontSize: 14),
              border: InputBorder.none,
            ),
          ),
        ),
      );
    }

    Widget buildAboutGuestSection() {
      return TapRegion(
        onTapOutside: (event) => {FocusScope.of(context).unfocus()},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: name,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Seu nome completo',
              labelStyle: GoogleFonts.poppins(fontSize: 14),
              border: InputBorder.none,
            ),
          ),
        ),
      );
    }

    Widget buildNotesSection() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: notes,
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: "Observações...",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
          ),
        ),
      );
    }

    Widget buildContactButtonsSection() {
      bool formIsValid() {
        String errorLabel = "";

        try {
          int.parse(guestCount.text);

          if (int.parse(guestCount.text) <= 0) {
            errorLabel = "Número de hóspedes inválido";
          }
        } catch (e) {
          errorLabel = "Número de hóspedes inválido";
        }

        if (name.text.isEmpty) {
          errorLabel = "Seu nome deve estar preenchido";
        }

        if (errorLabel.isNotEmpty) {
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(errorLabel),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          return false;
        }

        return true;
      }

      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!formIsValid()) {
                  return;
                }

                SendRentMessageModel model = SendRentMessageModel(
                  house: widget.house,
                  dateRange: selectedDateRange,
                  amount: finalAmount,
                  guestCount: int.parse(guestCount.text),
                  notes: notes.text,
                  name: name.text,
                );

                rentService.sendEmail(model);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "E-mail",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!formIsValid()) {
                  return;
                }

                SendRentMessageModel model = SendRentMessageModel(
                  house: widget.house,
                  dateRange: selectedDateRange,
                  amount: finalAmount,
                  guestCount: int.parse(guestCount.text),
                  notes: notes.text,
                  name: name.text,
                );

                rentService.sendWhatsApp(model);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "WhatsApp",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (canRunConstructor) {
      resolveFinalAmount();
      setState(() {
        canRunConstructor = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Solicitar reserva",
          style: GoogleFonts.merriweather(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    selectDateRange(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 17, 21, 91)
                          .withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      color: Color.fromARGB(255, 17, 21, 91),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: deviceHeight * 0.8,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCheckInOutSection(),
              const SizedBox(height: 10),
              buildGuestNumberSection(),
              const SizedBox(height: 10),
              buildAboutGuestSection(),
              const SizedBox(height: 10),
              buildNotesSection(),
              const SizedBox(height: 20),
              buildContactButtonsSection()
            ],
          ),
        ),
      ),
    );
  }
}
