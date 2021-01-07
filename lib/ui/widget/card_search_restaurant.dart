part of 'widget.dart';

class CardSearchRetaurant extends StatelessWidget {
  final RestaurantSearch restaurant;
  static const _imageUrl = 'https://restaurant-api.dicoding.dev/images/small';
  CardSearchRetaurant({Key key, @required this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Hero(
            tag: restaurant.pictureId,
            child: Material(
              child: InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "$_imageUrl/${restaurant.pictureId}",
                    width: 120,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          _flexSearchCard(),
        ],
      ),
    );
  }

  Widget _flexSearchCard() => Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name ?? "",
              style: amberTextFont.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: secondaryColor,
                  size: 15,
                ),
                SizedBox(width: 4),
                Text(
                  restaurant.city ?? "",
                  style: greyTextFont,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.stars,
                  color: mainColor,
                  size: 15,
                ),
                SizedBox(width: 4),
                Text(
                  restaurant.rating.toString() ?? "",
                  style: amberTextFont.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ],
        ),
      );
}
