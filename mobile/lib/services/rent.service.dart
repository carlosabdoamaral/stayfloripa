import 'package:stay_floripa/common/currency.dart';
import 'package:stay_floripa/common/date.dart';
import 'package:stay_floripa/models/house_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SendRentMessageModel {
  final HouseDetailsModel house;
  final DateTimeRange dateRange;
  final double amount;
  final int guestCount;
  final String notes;
  final String name;

  SendRentMessageModel({
    required this.house,
    required this.dateRange,
    required this.amount,
    required this.guestCount,
    required this.notes,
    required this.name,
  });
}

class RentService {
  String message = "";

  String _buildMessage(SendRentMessageModel props) {
    message =
        "Olá ${props.house.contact?.name}, me chamo ${props.name}. Gostaria de alugar o imóvel ${props.house.title} nos dias ${formatDate(props.dateRange.start)} até ${formatDate(props.dateRange.end)}. Estarei com ${props.guestCount} pessoas. O aplicativo calculou um valor total de ${getAmountFormatted(props.amount)}. ";

    if (props.notes.isNotEmpty) {
      message +=
          'Além disso gostaria de deixar essas observações: ${props.notes}';
    }

    return message;
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  void sendWhatsApp(SendRentMessageModel props) async {
    _buildMessage(props);
    await _launchURL(
      'https://wa.me//${props.house.contact!.phone}?text=$message',
    );
  }

  void sendEmail(
    SendRentMessageModel props,
  ) async {
    _buildMessage(props);
    await _launchURL(
      "mailto:${props.house.contact!.email}?subject=Aluguel de imóvel&body=$message",
    );
  }
}
