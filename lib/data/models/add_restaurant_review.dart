class AddRestaurantResult {
  AddRestaurantResult({
    this.error,
    this.message,
    this.customerReviews,
  });

  bool error;
  String message;
  List<CustomerReview> customerReviews;

  factory AddRestaurantResult.fromJson(Map<String, dynamic> json) =>
      AddRestaurantResult(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );
}

class CustomerReview {
  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
}
