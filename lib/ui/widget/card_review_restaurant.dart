part of 'widget.dart';

class CardReviewRestaurant extends StatelessWidget {
  final List<CustomerReview> listRestaurantReview;
  final int itemReview;
  const CardReviewRestaurant(
      {Key key, @required this.listRestaurantReview, this.itemReview});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount:
            itemReview == null ? listRestaurantReview.length : itemReview,
        itemBuilder: (context, index) {
          return _itemReviewRestaurant(listRestaurantReview[index]);
        },
      ),
    );
  }

  Widget _itemReviewRestaurant(CustomerReview customerReview) => Card(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerReview.name,
                style: whiteTextFont.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                customerReview.date,
                style: whiteTextFont.copyWith(fontSize: 14),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                customerReview.review,
                style: whiteTextFont.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      );
}
