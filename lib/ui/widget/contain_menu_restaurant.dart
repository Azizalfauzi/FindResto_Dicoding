part of 'widget.dart';

class ContainMenuRestaurant extends StatelessWidget {
  final List<Category> listData;
  const ContainMenuRestaurant({Key key, @required this.listData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return _itemMenu(listData[index].name);
        },
      ),
    );
  }

  Widget _itemMenu(String menu) => Container(
        width: 100,
        child: Card(
          color: mainColor,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                menu,
                style: whiteTextFont,
              ),
            ),
          ),
        ),
      );
}
