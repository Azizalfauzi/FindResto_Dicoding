import 'dart:convert';

import 'package:dicoding_fundamtental_submission/data/models/add_restaurant_review.dart';
import 'package:dicoding_fundamtental_submission/data/models/detail_restaurant.dart';
import 'package:dicoding_fundamtental_submission/data/models/list_restaurant.dart';
import 'package:dicoding_fundamtental_submission/data/models/search_restaurant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantResult> getListRestaurant() async {
    final response = await http.get(_baseUrl + '/list');
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list restaurant');
    }
  }

  Future<DetailRestaurantResult> getDetailRestaurant(String id) async {
    final response = await http.get(_baseUrl + '/detail/$id');
    if (response.statusCode == 200) {
      return DetailRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load get detail restaurant!');
    }
  }

  Future<SearchRestaurantResult> getSearchRestaurant(String search) async {
    final response = await http.get(_baseUrl + '/search?q=$search');
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search restaurant data!');
    }
  }

  Future<AddRestaurantResult> postAddReviewRestaurant(String body) async {
    final response = await http.post(
      _baseUrl + '/review',
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': '12345',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return AddRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add restaurant data!');
    }
  }
}
