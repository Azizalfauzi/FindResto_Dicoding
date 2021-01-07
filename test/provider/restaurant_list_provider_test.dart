import 'package:dicoding_fundamtental_submission/data/api/api_services.dart';
import 'package:dicoding_fundamtental_submission/data/models/list_restaurant.dart';
import 'package:dicoding_fundamtental_submission/provider/restaurant_list_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('Restaurant Provider Test', () {
    RestaurantProvider restaurantProvider;
    ApiService apiService;

    setUp(() {
      apiService = MockApiService();
      when(apiService.getListRestaurant())
          .thenAnswer((_) async => RestaurantResult.fromJson(responseApi));
      restaurantProvider = RestaurantProvider(apiService: apiService);
    });
    test('Cek parsing Api Retaurant', () async {
      //average
      var result = restaurantProvider.result.restaurants[0];
      var json = Restaurant.fromJson(restaurantTest);

      //ekspektasi
      expect(result.id == json.id, true);
      expect(result.name == json.name, true);
      expect(result.pictureId == json.pictureId, true);
      expect(result.city == json.city, true);
      expect(result.rating == json.rating, true);
    });
  });
}

const restaurantTest = {
  "id": "s1knt6za9kkfw1e867",
  "name": "Kafe Kita",
  "description":
      "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
  "pictureId": "25",
  "city": "Gorontalo",
  "rating": 4
};
const responseApi = {
  "error": false,
  "message": "success",
  "count": 1,
  "restaurants": [
    {
      "id": "s1knt6za9kkfw1e867",
      "name": "Kafe Kita",
      "description":
          "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
      "pictureId": "25",
      "city": "Gorontalo",
      "rating": 4
    }
  ]
};
