class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profileImage,
    required this.address,
    this.phone,
    this.website,
    this.company,
  });

  int id;
  String name;
  String username;
  String email;
  String? profileImage;
  Address address;
  String? phone;
  String? website;
  Company? company;

  Profile.fromJson(Map<String, dynamic> json) :
    id = json["id"],
    name = json["name"],
    username = json["username"],
    email = json["email"],
    profileImage = json["profile_image"],
    address = Address.fromJson(json["address"]),
    phone = json["phone"],
    website = json["website"],
    company = json["company"] == null ? null : Company.fromJson(json["company"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "profile_image": profileImage,
    "address": address.toJson(),
    "phone": phone,
    "website": website,
    "company": company?.toJson(),
  };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address.fromJson(Map<String, dynamic> json) :
    street = json["street"],
    suite = json["suite"],
    city = json["city"],
    zipcode = json["zipcode"],
    geo = Geo.fromJson(json["geo"]);

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo.toJson(),
  };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  Geo.fromJson(Map<String, dynamic> json) :
    lat = json["lat"],
    lng = json["lng"];

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  Company.fromJson(Map<String, dynamic> json) :
    name = json["name"],
    catchPhrase = json["catchPhrase"],
    bs = json["bs"];

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}