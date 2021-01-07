import 'package:dicoding_fundamtental_submission/data/api/api_services.dart';
import 'package:dicoding_fundamtental_submission/data/models/list_restaurant.dart';
import 'package:flutter/cupertino.dart';

import 'enum_result.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({@required this.apiService}) {
    _fetchAllRestaurant();
  }

  RestaurantResult _restaurantResult;
  String _message = '';
  ResultStateRestaurant _state;

  String get message => _message;
  RestaurantResult get result => _restaurantResult;
  ResultStateRestaurant get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultStateRestaurant.Loading;
      notifyListeners();
      final restaurantData = await apiService.getListRestaurant();
      if (restaurantData.restaurants.isEmpty) {
        _state = ResultStateRestaurant.NoData;
        notifyListeners();
        return _message = 'Data kosong!';
      } else {
        _state = ResultStateRestaurant.HasData;
        notifyListeners();
        return _restaurantResult = restaurantData;
      }
    } catch (e) {
      _state = ResultStateRestaurant.Error;
      notifyListeners();
      print(e);
      return _message = 'Error--> $e';
    }
  }
}
