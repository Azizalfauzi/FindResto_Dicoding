part of 'pages.dart';

class ListPageRestaurant extends StatefulWidget {
  static const routeName = '/list_page';
  ListPageRestaurant({Key key}) : super(key: key);

  @override
  _ListPageRestaurantState createState() => _ListPageRestaurantState();
}

class _ListPageRestaurantState extends State<ListPageRestaurant>
    with SingleTickerProviderStateMixin {
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _backgroundService = BackgroundService();
  FancyDrawerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
    port.listen((_) async => await _backgroundService.someTask());
    _notificationHelper
        .configureSelectNotificationSubject(DetailPage.routeName);
  }

  @override
  void dispose() {
    _controller.dispose();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.amber,
        controller: _controller,
        drawerItems: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/tp12-48f0d.appspot.com/o/pas_foto.jpg?alt=media&token=4f4b8d52-bee7-453b-8fa0-4eeb4148cad3'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aziz Alfauzi',
                style: whiteTextFont,
              ),
              Text('azizalfauzi65@gmail.com', style: whiteTextFont),
              Text('Dicoding Submission Final', style: whiteTextFont),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, FavoriteRestaurantPage.routeName),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Favorite",
                  style: whiteTextFont.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, SettingsRestaurantPage.routeName),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Settings",
                  style: whiteTextFont.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              _controller.close();
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Back",
                  style: whiteTextFont.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              SystemNavigator.pop();
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Close App",
                  style: whiteTextFont.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
        ],
        child: Scaffold(
            backgroundColor: mainColor,
            body: SafeArea(
              child: Column(
                children: [
                  _headerPage(context),
                  _boxListItems(context),
                ],
              ),
            )),
      ),
    );
  }

  Widget _headerPage(BuildContext context) => Container(
        height: 160,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _controller.toggle();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Dicoding Submission",
                      style: whiteTextFont.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, SearchRestaurantPage.routeName);
                        },
                      )),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            'Find Resto',
                            style: GoogleFonts.dancingScript(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/chef.png'),
                              )),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'Recomended restaurant for you!',
                        style: whiteTextFont.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _boxListItems(BuildContext context) => Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ChangeNotifierProvider<RestaurantProvider>(
            create: (_) => RestaurantProvider(apiService: ApiService()),
            child: _consumer(),
          ),
        ),
      );

  Consumer<RestaurantProvider> _consumer() => Consumer(
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
                itemCount: value.result.count,
                itemBuilder: (context, index) {
                  var restaurantData = value.result.restaurants[index];
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      DetailPage.routeName,
                      arguments: restaurantData.id,
                    ),
                    child: CardListRestaurant(
                      restaurant: restaurantData,
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
