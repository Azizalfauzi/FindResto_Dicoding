class SearchRestaurantResult {
  SearchRestaurantResult({
    this.error,
    this.founded,
    this.restaurants,
  });

  bool error;
  int founded;
  List<RestaurantSearch> restaurants;

  factory SearchRestaurantResult.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantResult(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<RestaurantSearch>.from(
            json["restaurants"].map((x) => RestaurantSearch.fromJson(x))),
      );
}

class RestaurantSearch {
  RestaurantSearch({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory RestaurantSearch.fromJson(Map<String, dynamic> json) =>
      RestaurantSearch(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );
}
