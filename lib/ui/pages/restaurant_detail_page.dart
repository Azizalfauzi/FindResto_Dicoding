part of 'pages.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';
  final String id;
  DetailPage({@required this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final callProvider = DetailRestaurantProvider(apiService: ApiService());
  final callDbProvider =
      DatabaseRestaurantProvider(databaseHelper: DatabaseHelper());
  static const _imageUrl = 'https://restaurant-api.dicoding.dev/images/medium';
  @override
  void initState() {
    callProvider.fetchDetailRestaurant(widget.id);
    callDbProvider.isDataFavorite(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) => callProvider,
      child: Scaffold(
        body: Consumer<DetailRestaurantProvider>(
          builder: (context, value, _) {
            switch (value.state) {
              case ResultStateRestaurant.Loading:
                return Center(
                  child: loadingIndicator,
                );
                break;
              case ResultStateRestaurant.HasData:
                return ChangeNotifierProvider<DatabaseRestaurantProvider>.value(
                  value: callDbProvider,
                  child: Consumer<DatabaseRestaurantProvider>(
                    builder: (context, dbValue, child) => NestedScrollView(
                      headerSliverBuilder: (context, boxIsScrolled) {
                        if (boxIsScrolled) {
                          return [
                            SliverAppBar(
                              iconTheme: IconThemeData(color: Colors.white),
                              pinned: true,
                              expandedHeight: 220,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Hero(
                                  tag: value.result.restaurant.pictureId,
                                  child: Image.network(
                                    '$_imageUrl/${value.result.restaurant.pictureId}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  value.result.restaurant.name,
                                  style: whiteTextFont.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                titlePadding:
                                    EdgeInsets.only(left: 54, bottom: 16),
                              ),
                              actions: [
                                _favoriteButton(value.result.restaurant),
                              ],
                            )
                          ];
                        } else {
                          return [
                            SliverAppBar(
                              iconTheme: IconThemeData(color: Colors.white),
                              pinned: true,
                              expandedHeight: 220,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Hero(
                                  tag: value.result.restaurant.pictureId,
                                  child: Image.network(
                                    '$_imageUrl/${value.result.restaurant.pictureId}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              actions: [
                                _favoriteButton(value.result.restaurant),
                              ],
                            )
                          ];
                        }
                      },
                      body: Container(
                        transform: Matrix4.translationValues(0.0, -9.0, 0.0),
                        child: _contentDetail(context, value.result.restaurant),
                      ),
                    ),
                  ),
                );
                break;
              case ResultStateRestaurant.NoData:
                return Center(
                  child: Column(
                    children: [
                      loadingIndicator,
                      SizedBox(
                        height: 10,
                      ),
                      Text(value.message),
                    ],
                  ),
                );
              case ResultStateRestaurant.Error:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Cek koneksi internet anda !"),
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
        ),
      ),
    );
  }

  Widget _contentDetail(BuildContext context, RestaurantDetail restaurant) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(restaurant.name,
                  style: amberTextFont.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category Foods :',
                      style: amberTextFont.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      )),
                  ContainCategoryRestaurant(
                      listCategory: restaurant.categories),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    restaurant.city,
                    style: greyTextFont,
                  ),
                  Spacer(),
                  Row(
                    children: _ratingDetail(restaurant.rating),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: Colors.amber,
              ),
              SizedBox(
                height: 8,
              ),
              Text('Description',
                  style: amberTextFont.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 6),
              Text(
                restaurant.description,
                style: greyTextFont,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.amber,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Menu Makanan & Minuman',
                  style: amberTextFont.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              ContainMenuRestaurant(listData: restaurant.menus.foods),
              SizedBox(height: 6),
              ContainMenuRestaurant(listData: restaurant.menus.drinks),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.amber,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Review Restaurant',
                    style: amberTextFont.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            width: 1,
                            color: mainColor,
                          )),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Review Resto',
                              style: amberTextFont.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                            Icon(
                              Icons.rate_review,
                              color: mainColor,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AddReviewPage.routeName,
                              arguments: restaurant.id);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CardReviewRestaurant(
                listRestaurantReview: restaurant.customerReviews,
                itemReview: 2,
              ),
              SizedBox(height: 10),
            ],
          ),
        )),
      );

  List<Widget> _ratingDetail(double rate) {
    final children = <Widget>[];
    for (var i = 0; i < rate; i++) {
      children.add(Icon(
        Icons.stars,
        color: Colors.yellow,
        size: 15,
      ));
    }
    return children;
  }

  void _addDataFavorite(RestaurantDetail data) {
    Favorite favorite = Favorite(
      id: data.id,
      name: data.name,
      description: data.description,
      city: data.city,
      address: data.address,
      pictureId: data.pictureId,
      rating: data.rating,
    );
    callDbProvider.addDataFavorite(favorite);
  }

  Widget _favoriteButton(RestaurantDetail restaurantDetail) =>
      FutureBuilder<bool>(
        future: callDbProvider.isDataFavorite(widget.id),
        builder: (context, snapshot) {
          var isFavoriteBtn = snapshot.data ?? false;
          if (isFavoriteBtn) {
            return favBtn(
              Icon(Icons.favorite),
              () {
                callDbProvider.removeDataFavorite(widget.id);
              },
            );
          } else {
            return favBtn(
              Icon(Icons.favorite_border),
              () {
                _addDataFavorite(restaurantDetail);
              },
            );
          }
        },
      );
  Widget favBtn(Icon icon, Function onPressed) => Padding(
        padding: EdgeInsets.only(
          right: 10,
        ),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      );
}
