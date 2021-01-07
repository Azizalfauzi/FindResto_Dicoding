import 'package:dicoding_fundamtental_submission/data/api/api_services.dart';
import 'package:dicoding_fundamtental_submission/data/models/search_restaurant.dart';
import 'package:dicoding_fundamtental_submission/provider/enum_result.dart';
import 'package:flutter/cupertino.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantSearchProvider({@required this.apiService});

  SearchRestaurantResult _restaurantSearchResult;

  String _message = '';

  ResultStateRestaurant _state;

  String get message => _message;
  SearchRestaurantResult get result => _restaurantSearchResult;
  ResultStateRestaurant get state => _state;

  Future<dynamic> fetchSearchRestaurant(String search) async {
    try {
      _state = ResultStateRestaurant.Loading;
      notifyListeners();
      final searchData = await apiService.getSearchRestaurant(search);
      if (searchData.restaurants.isEmpty) {
        _state = ResultStateRestaurant.NoData;
        notifyListeners();
        return _message = 'Data kosong!';
      } else {
        _state = ResultStateRestaurant.HasData;
        notifyListeners();
        return _restaurantSearchResult = searchData;
      }
    } catch (e) {
      _state = ResultStateRestaurant.Error;
      notifyListeners();
      print(e);
      return _message = 'Error-> $e';
    }
  }
}
