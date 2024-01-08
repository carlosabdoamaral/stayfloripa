// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals

class HouseDetailsModel {
  int? id;
  String? title;
  String? description;
  double? price;
  int? maxGuests;
  List<String>? images;
  Contact? contact;
  About? about;
  Count? count;
  Location? location;
  CheckInOut? checkInOut;
  Rules? rules;
  BeforeLeaving? cancellationPolicy;

  HouseDetailsModel(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.maxGuests,
      this.images,
      this.contact,
      this.about,
      this.count,
      this.location,
      this.checkInOut,
      this.rules,
      this.cancellationPolicy});

  HouseDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    maxGuests = json['maxGuests'];
    images = json['images'].cast<String>();
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    about = json['about'] != null ? new About.fromJson(json['about']) : null;
    count = json['count'] != null ? new Count.fromJson(json['count']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    checkInOut = json['checkInOut'] != null
        ? new CheckInOut.fromJson(json['checkInOut'])
        : null;
    rules = json['rules'] != null ? new Rules.fromJson(json['rules']) : null;
    cancellationPolicy = json['cancellationPolicy'] != null
        ? new BeforeLeaving.fromJson(json['cancellationPolicy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['maxGuests'] = this.maxGuests;
    data['images'] = this.images;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.about != null) {
      data['about'] = this.about!.toJson();
    }
    if (this.count != null) {
      data['count'] = this.count!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.checkInOut != null) {
      data['checkInOut'] = this.checkInOut!.toJson();
    }
    if (this.rules != null) {
      data['rules'] = this.rules!.toJson();
    }
    if (this.cancellationPolicy != null) {
      data['cancellationPolicy'] = this.cancellationPolicy!.toJson();
    }
    return data;
  }
}

class Contact {
  String? name;
  String? email;
  String? phone;
  String? obs;

  Contact({this.name, this.email, this.phone, this.obs});

  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    obs = json['obs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['obs'] = this.obs;
    return data;
  }
}

class About {
  String? space;
  String? access;
  String? notes;

  About({this.space, this.access, this.notes});

  About.fromJson(Map<String, dynamic> json) {
    space = json['space'];
    access = json['access'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['space'] = this.space;
    data['access'] = this.access;
    data['notes'] = this.notes;
    return data;
  }
}

class Count {
  int? bedrooms;
  int? beds;
  int? bathrooms;

  Count({this.bedrooms, this.beds, this.bathrooms});

  Count.fromJson(Map<String, dynamic> json) {
    bedrooms = json['bedrooms'];
    beds = json['beds'];
    bathrooms = json['bathrooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bedrooms'] = this.bedrooms;
    data['beds'] = this.beds;
    data['bathrooms'] = this.bathrooms;
    return data;
  }
}

class Location {
  String? address;
  String? neighborhood;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? mapsURL;

  Location(
      {this.address,
      this.neighborhood,
      this.city,
      this.state,
      this.country,
      this.zip,
      this.mapsURL});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    mapsURL = json['mapsURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['mapsURL'] = this.mapsURL;
    return data;
  }
}

class CheckInOut {
  String? checkIn;
  String? checkOut;

  CheckInOut({this.checkIn, this.checkOut});

  CheckInOut.fromJson(Map<String, dynamic> json) {
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkIn'] = this.checkIn;
    data['checkOut'] = this.checkOut;
    return data;
  }
}

class Rules {
  During? during;
  BeforeLeaving? beforeLeaving;

  Rules({this.during, this.beforeLeaving});

  Rules.fromJson(Map<String, dynamic> json) {
    during =
        json['during'] != null ? new During.fromJson(json['during']) : null;
    beforeLeaving = json['beforeLeaving'] != null
        ? new BeforeLeaving.fromJson(json['beforeLeaving'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.during != null) {
      data['during'] = this.during!.toJson();
    }
    if (this.beforeLeaving != null) {
      data['beforeLeaving'] = this.beforeLeaving!.toJson();
    }
    return data;
  }
}

class During {
  List<String>? list;
  List<String>? forbidden;

  During({this.list, this.forbidden});

  During.fromJson(Map<String, dynamic> json) {
    list = json['list'].cast<String>();
    forbidden = json['forbidden'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this.list;
    data['forbidden'] = this.forbidden;
    return data;
  }
}

class BeforeLeaving {
  List<String>? list;

  BeforeLeaving({this.list});

  BeforeLeaving.fromJson(Map<String, dynamic> json) {
    list = json['list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this.list;
    return data;
  }
}
