class HouseDetailsModel {
  int? id;
  String? title;
  String? description;
  double? price;
  int? maxGuests;
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
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    about = json['about'] != null ? About.fromJson(json['about']) : null;
    count = json['count'] != null ? Count.fromJson(json['count']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    checkInOut = json['checkInOut'] != null
        ? CheckInOut.fromJson(json['checkInOut'])
        : null;
    rules = json['rules'] != null ? Rules.fromJson(json['rules']) : null;
    cancellationPolicy = json['cancellationPolicy'] != null
        ? BeforeLeaving.fromJson(json['cancellationPolicy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['maxGuests'] = maxGuests;
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    if (about != null) {
      data['about'] = about!.toJson();
    }
    if (count != null) {
      data['count'] = count!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (checkInOut != null) {
      data['checkInOut'] = checkInOut!.toJson();
    }
    if (rules != null) {
      data['rules'] = rules!.toJson();
    }
    if (cancellationPolicy != null) {
      data['cancellationPolicy'] = cancellationPolicy!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['obs'] = obs;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['space'] = space;
    data['access'] = access;
    data['notes'] = notes;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bedrooms'] = bedrooms;
    data['beds'] = beds;
    data['bathrooms'] = bathrooms;
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

  Location(
      {this.address,
      this.neighborhood,
      this.city,
      this.state,
      this.country,
      this.zip});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['neighborhood'] = neighborhood;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['zip'] = zip;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['checkIn'] = checkIn;
    data['checkOut'] = checkOut;
    return data;
  }
}

class Rules {
  During? during;
  BeforeLeaving? beforeLeaving;

  Rules({this.during, this.beforeLeaving});

  Rules.fromJson(Map<String, dynamic> json) {
    during = json['during'] != null ? During.fromJson(json['during']) : null;
    beforeLeaving = json['beforeLeaving'] != null
        ? BeforeLeaving.fromJson(json['beforeLeaving'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (during != null) {
      data['during'] = during!.toJson();
    }
    if (beforeLeaving != null) {
      data['beforeLeaving'] = beforeLeaving!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list'] = list;
    data['forbidden'] = forbidden;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list'] = list;
    return data;
  }
}
