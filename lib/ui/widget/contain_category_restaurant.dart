part of 'widget.dart';

class ContainCategoryRestaurant extends StatelessWidget {
  final List<Category> listCategory;
  const ContainCategoryRestaurant({Key key, @required this.listCategory})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return _itemCategory(listCategory[index].name);
        },
      ),
    );
  }

  Widget _itemCategory(String category) => Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: mainColor,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              category,
              style: whiteTextFont.copyWith(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      );
}
