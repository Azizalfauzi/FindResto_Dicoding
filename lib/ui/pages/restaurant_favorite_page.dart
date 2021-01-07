part of 'pages.dart';

class FavoriteRestaurantPage extends StatefulWidget {
  static const routeName = '/favorite_page';
  @override
  _FavoriteRestaurantPageState createState() => _FavoriteRestaurantPageState();
}

class _FavoriteRestaurantPageState extends State<FavoriteRestaurantPage> {
  final callDbProvider =
      DatabaseRestaurantProvider(databaseHelper: DatabaseHelper());
  @override
  void initState() {
    callDbProvider.getDataFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatabaseRestaurantProvider>(
      create: (_) => callDbProvider,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            _headerPage(context),
            _boxListItemsFavorite(context),
          ],
        )),
      ),
    );
  }

  Widget _headerPage(BuildContext context) => Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            )),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: Text(
                      "Favorite Page",
                      style: whiteTextFont.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            callDbProvider.getDataFavorite();
                          });
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  Widget _boxListItemsFavorite(BuildContext context) => Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ChangeNotifierProvider<DatabaseRestaurantProvider>(
            create: (_) => callDbProvider,
            child: _consumerFav(),
          ),
        ),
      );
  Consumer<DatabaseRestaurantProvider> _consumerFav() => Consumer(
        builder: (context, value, _) {
          switch (value.state) {
            case ResultStateRestaurant.Loading:
              return Center(
                child: loadingIndicator,
              );
              break;
            case ResultStateRestaurant.HasData:
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10),
                itemCount: value.favorite.length,
                itemBuilder: (context, index) {
                  var restaurantData = value.favorite[index];
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      DetailPage.routeName,
                      arguments: restaurantData.id,
                    ),
                    child: Dismissible(
                      key: Key(restaurantData.id),
                      background: Container(
                        color: mainColor,
                      ),
                      onDismissed: (_) =>
                          callDbProvider.removeDataFavorite(restaurantData.id),
                      child: CardListFavorite(restaurant: restaurantData),
                    ),
                  );
                },
              );
              break;
            case ResultStateRestaurant.NoData:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value.message),
                  ],
                ),
              );
            case ResultStateRestaurant.Error:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Cek koneksi internet anda!'),
                      ],
                    ),
                  ],
                ),
              );
            default:
              return Center(
                child: Text(''),
              );
              break;
          }
        },
      );
}
