import 'package:dicoding_fundamtental_submission/data/models/favorite_restaurant.dart';
import 'package:test/test.dart';

void main() {
  test('Test Parse Data', () {
    var dataFav = Favorite.fromJson(jsonFav);
    expect((dataFav.id == object.id), true);
    expect((dataFav.name == object.name), true);
    expect((dataFav.description == object.description), true);
    expect((dataFav.city == object.city), true);
    expect((dataFav.address == object.address), true);
    expect((dataFav.pictureId == object.pictureId), true);
    expect((dataFav.rating == object.rating), true);
  });
}

Favorite object = Favorite(
  id: "uewq1zg2zlskfw1e867",
  name: "Kafein",
  description:
      "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
  city: "Aceh",
  address: "Jln. Belimbing Timur no 27",
  pictureId: "15",
  rating: 4.6,
);

const jsonFav = {
  "id": "uewq1zg2zlskfw1e867",
  "name": "Kafein",
  "description":
      "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
  "city": "Aceh",
  "address": "Jln. Belimbing Timur no 27",
  "pictureId": "15",
  "rating": 4.6
};
