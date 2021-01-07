class Favorite {
  Favorite({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.rating,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  double rating;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      city: json["city"],
      address: json["address"],
      pictureId: json["pictureId"],
      rating: json["rating"].toDouble());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "rating": rating,
      };
}
