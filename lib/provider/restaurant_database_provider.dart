import 'package:dicoding_fundamtental_submission/data/db/database_helper.dart';
import 'package:dicoding_fundamtental_submission/data/models/favorite_restaurant.dart';
import 'package:dicoding_fundamtental_submission/provider/enum_result.dart';
import 'package:flutter/cupertino.dart';

class DatabaseRestaurantProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;
  DatabaseRestaurantProvider({@required this.databaseHelper});
  String _message = '';
  String get message => _message;
  ResultStateRestaurant _state;
  ResultStateRestaurant get state => _state;
  List<Favorite> _favorite = [];
  List<Favorite> get favorite => _favorite;

  void getDataFavorite() async {
    _favorite = await databaseHelper.getDataFavorites();
    if (_favorite.length > 0) {
      _state = ResultStateRestaurant.HasData;
    } else {
      _state = ResultStateRestaurant.NoData;
      _message = 'Data kosong';
    }
  }

  void addDataFavorite(Favorite favorite) async {
    try {
      await databaseHelper.insertData(favorite);
      notifyListeners();
    } catch (e) {
      _state = ResultStateRestaurant.Error;
      _message = 'Input Data Gagal!';
      notifyListeners();
    }
  }

  void removeDataFavorite(String id) async {
    try {
      await databaseHelper.removeDataFavorite(id);
      getDataFavorite();
      notifyListeners();
    } catch (e) {
      _state = ResultStateRestaurant.Error;
      _message = 'Gagal Menghapus Data!';
      notifyListeners();
    }
  }

  Future<bool> isDataFavorite(String id) async {
    final favoriteDataRestaurant = await databaseHelper.getFavoriteDataById(id);
    return favoriteDataRestaurant.isNotEmpty;
  }
}
