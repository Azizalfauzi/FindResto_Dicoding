import 'package:dicoding_fundamtental_submission/data/api/api_services.dart';
import 'package:dicoding_fundamtental_submission/data/models/detail_restaurant.dart';
import 'package:dicoding_fundamtental_submission/provider/restaurant_detail_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('Detail Provider Test', () {
    DetailRestaurantProvider detailRestaurantProvider;
    ApiService apiService;

    setUp(() {
      apiService = MockApiService();
      detailRestaurantProvider =
          DetailRestaurantProvider(apiService: apiService);
      var id = "w9pga3s2tubkfw1e867";
      //action get id Restraunt
      when(apiService.getDetailRestaurant(id)).thenAnswer(
          (_) async => DetailRestaurantResult.fromJson(responseApi));
      detailRestaurantProvider.fetchDetailRestaurant(id);
    });
    test('Cek hasil response api detail', () async {
      //average
      var result = detailRestaurantProvider.result.restaurant;
      var json = RestaurantDetail.fromJson(restaurantDetailTest);
      //assert
      expect(result.id == json.id, true);
      expect(result.name == json.name, true);
      expect(result.description == json.description, true);
      expect(result.city == json.city, true);
      expect(result.address == json.address, true);
      expect(result.pictureId == json.pictureId, true);
      expect(result.rating == json.rating, true);
    });
  });
}

const restaurantDetailTest = {
  "id": "w9pga3s2tubkfw1e867",
  "name": "Bring Your Phone Cafe",
  "description":
      "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
  "city": "Surabaya",
  "address": "Jln. Belimbing Timur no 27",
  "pictureId": "03",
  "categories": [
    {"name": "Modern"},
    {"name": "Italia"}
  ],
  "menus": {
    "foods": [
      {"name": "Salad lengkeng"},
      {"name": "Sosis squash dan mint"},
      {"name": "Toastie salmon"},
      {"name": "Salad yuzu"},
      {"name": "Matzo farfel"},
      {"name": "Kari terong"},
      {"name": "roket penne"},
      {"name": "Napolitana"},
      {"name": "Daging Sapi"},
      {"name": "Bebek crepes"},
      {"name": "Sup Kohlrabi"},
      {"name": "Ikan teri dan roti"},
      {"name": "Tumis leek"}
    ],
    "drinks": [
      {"name": "Kopi espresso"},
      {"name": "Coklat panas"},
      {"name": "Jus jeruk"},
      {"name": "Jus apel"},
      {"name": "Minuman soda"},
      {"name": "Air"},
      {"name": "Es kopi"}
    ]
  },
  "rating": 4.2,
  "customerReviews": [
    {"name": "Widdy", "review": "Tidak ada duanya!", "date": "13 Juli 2019"},
    {
      "name": "Ahmad",
      "review": "Tidak rekomendasi untuk pelajar!",
      "date": "13 November 2019"
    },
    {
      "name": "Gilang",
      "review": "Saya sangat suka menu malamnya!",
      "date": "13 Juli 2019"
    }
  ]
};
const responseApi = {
  "error": false,
  "message": "success",
  "restaurant": {
    "id": "w9pga3s2tubkfw1e867",
    "name": "Bring Your Phone Cafe",
    "description":
        "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
    "city": "Surabaya",
    "address": "Jln. Belimbing Timur no 27",
    "pictureId": "03",
    "categories": [
      {"name": "Modern"},
      {"name": "Italia"}
    ],
    "menus": {
      "foods": [
        {"name": "Salad lengkeng"},
        {"name": "Sosis squash dan mint"},
        {"name": "Toastie salmon"},
        {"name": "Salad yuzu"},
        {"name": "Matzo farfel"},
        {"name": "Kari terong"},
        {"name": "roket penne"},
        {"name": "Napolitana"},
        {"name": "Daging Sapi"},
        {"name": "Bebek crepes"},
        {"name": "Sup Kohlrabi"},
        {"name": "Ikan teri dan roti"},
        {"name": "Tumis leek"}
      ],
      "drinks": [
        {"name": "Kopi espresso"},
        {"name": "Coklat panas"},
        {"name": "Jus jeruk"},
        {"name": "Jus apel"},
        {"name": "Minuman soda"},
        {"name": "Air"},
        {"name": "Es kopi"}
      ]
    },
    "rating": 4.2,
    "customerReviews": [
      {"name": "Widdy", "review": "Tidak ada duanya!", "date": "13 Juli 2019"},
      {
        "name": "Ahmad",
        "review": "Tidak rekomendasi untuk pelajar!",
        "date": "13 November 2019"
      },
      {
        "name": "Gilang",
        "review": "Saya sangat suka menu malamnya!",
        "date": "13 Juli 2019"
      }
    ]
  }
};
