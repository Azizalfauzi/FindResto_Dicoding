part of 'pages.dart';

class SearchRestaurantPage extends StatefulWidget {
  static const routeName = '/search_page';
  @override
  _SearchRestaurantPageState createState() => _SearchRestaurantPageState();
}

class _SearchRestaurantPageState extends State<SearchRestaurantPage> {
  String _searchText = '';
  TextEditingController _searchData = TextEditingController();

  final callProvider = RestaurantSearchProvider(apiService: ApiService());

  @override
  void initState() {
    super.initState();
    callProvider.fetchSearchRestaurant(_searchText);
  }

  _SearchRestaurantPageState() {
    _searchData.addListener(() {
      setState(() {
        _searchText = _searchData.text;
        callProvider.fetchSearchRestaurant(_searchText);
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _searchData.dispose();
    _searchData.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (_) => callProvider,
      child: Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(
                        'Search Resto',
                        style: whiteTextFont.copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                _searchViewRestaurant(),
                _boxFindData(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchViewRestaurant() => Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _searchData,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                  borderRadius: BorderRadius.circular(20)),
              hintText: 'Search Restaurant here',
              hintStyle: amberTextFont,
              labelStyle: amberTextFont,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.amber,
              ),
            ),
            style: amberTextFont,
            cursorColor: Colors.amber,
          ),
        ),
      );
  Widget _boxFindData(BuildContext context) => Expanded(
          child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
          ),
        ),
        child: _consumerFind(),
      ));
  Consumer<RestaurantSearchProvider> _consumerFind() => Consumer(
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
                itemCount: value.result.founded,
                itemBuilder: (context, index) {
                  var restaurant = value.result.restaurants[index];
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      DetailPage.routeName,
                      arguments: restaurant.id,
                    ),
                    child: CardSearchRetaurant(restaurant: restaurant),
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
                    Text('Cek koneksi internet anda!'),
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
