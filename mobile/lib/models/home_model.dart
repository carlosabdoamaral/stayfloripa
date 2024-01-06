import 'dart:convert';

class HomeDetailsModel {
  int id;
  String name;
  double pricePerNight;
  About about;
  List<dynamic> tags;
  List<dynamic> images;
  Location location;
  Rules rules;
  Responsible responsible;

  HomeDetailsModel({
    required this.id,
    required this.name,
    required this.pricePerNight,
    required this.about,
    required this.tags,
    required this.images,
    required this.location,
    required this.rules,
    required this.responsible,
  });
}

class Responsible {
  String name;
  String email;
  String phone;
  String obs;

  Responsible({
    required this.name,
    required this.email,
    required this.phone,
    required this.obs,
  });
}

class Rules {
  List<String> checkInOut;
  DuringStay duringStay;
  BeforeLeaving beforeLeaving;
  List<dynamic> cancellationPolicy;
  List<dynamic> additional;
  int maxGuests;

  Rules({
    required this.checkInOut,
    required this.duringStay,
    required this.beforeLeaving,
    required this.cancellationPolicy,
    required this.additional,
    required this.maxGuests,
  });
}

class BeforeLeaving {
  List<String> list;

  BeforeLeaving({
    required this.list,
  });
}

class DuringStay {
  List<String> list;
  List<String> forbidden;

  DuringStay({
    required this.list,
    required this.forbidden,
  });
}

class Location {
  String cep;
  String neighborhood;
  String address;
  String lat;
  String lng;
  String iframeSource;

  Location({
    required this.cep,
    required this.neighborhood,
    required this.address,
    required this.lat,
    required this.lng,
    required this.iframeSource,
  });
}

class About {
  String general;
  String space;
  String guestAccess;
  String other;
  Count count;

  About({
    required this.general,
    required this.space,
    required this.guestAccess,
    required this.other,
    required this.count,
  });
}

class Count {
  int bedrooms;
  int bed;
  int bathroom;

  Count({
    required this.bedrooms,
    required this.bed,
    required this.bathroom,
  });
}
