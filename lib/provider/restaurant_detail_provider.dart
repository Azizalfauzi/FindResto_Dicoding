import 'dart:convert';

import 'package:dicoding_fundamtental_submission/data/api/api_services.dart';
import 'package:dicoding_fundamtental_submission/data/models/add_restaurant_review.dart';
import 'package:dicoding_fundamtental_submission/data/models/detail_restaurant.dart';
import 'package:dicoding_fundamtental_submission/provider/enum_result.dart';
import 'package:flutter/cupertino.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  ApiService apiService;
  DetailRestaurantProvider({@required this.apiService});

  AddRestaurantResult _addRestaurantResult;
  DetailRestaurantResult _detailRestaurantResult;
  String _message;
  ResultStateRestaurant _state;

  String get message => _message;
  DetailRestaurantResult get result => _detailRestaurantResult;
  AddRestaurantResult get resultAdd => _addRestaurantResult;
  ResultStateRestaurant get state => _state;

  Future<dynamic> fetchDetailRestaurant(String id) async {
    try {
      _state = ResultStateRestaurant.Loading;
      notifyListeners();
      final restaurantDetail = await apiService.getDetailRestaurant(id);
      if (restaurantDetail.restaurant == null) {
        _state = ResultStateRestaurant.HasData;
        notifyListeners();
        return _message = 'Data Kosong!';
      } else {
        _state = ResultStateRestaurant.HasData;
        notifyListeners();
        return _detailRestaurantResult = restaurantDetail;
      }
    } catch (e) {
      _state = ResultStateRestaurant.Error;
      notifyListeners();
      print(e);
      return _message = 'Error--> $e';
    }
  }

  Future<dynamic> addRestaurantReview(Map addReview) async {
    try {
      _state = ResultStateRestaurant.Loading;
      notifyListeners();
      String body = json.encode(addReview);
      final addRestaurantReview =
          await apiService.postAddReviewRestaurant(body);
      if (addRestaurantReview.customerReviews.isEmpty) {
        _state = ResultStateRestaurant.NoData;
        notifyListeners();
        return _message = 'Data kosong!';
      } else {
        _state = ResultStateRestaurant.HasData;
        notifyListeners();
        return _addRestaurantResult = addRestaurantReview;
      }
    } catch (e) {
      _state = ResultStateRestaurant.Error;
      notifyListeners();
      print(e);
      return _message = 'Error--> $e';
    }
  }
}
