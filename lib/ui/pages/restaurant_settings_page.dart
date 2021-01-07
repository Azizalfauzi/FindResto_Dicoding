part of 'pages.dart';

class SettingsRestaurantPage extends StatefulWidget {
  static const routeName = '/settings_page';
  @override
  _SettingsRestaurantPageState createState() => _SettingsRestaurantPageState();
}

class _SettingsRestaurantPageState extends State<SettingsRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _headerPage(context),
            _boxListTileSettings(context),
          ],
        ),
      ),
    );
  }
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
                    "Settings Page",
                    style: whiteTextFont.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget _boxListTileSettings(BuildContext context) => Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ChangeNotifierProvider<RestaurantScheduleProvider>(
          create: (_) => RestaurantScheduleProvider(
              restaurantPreferenceHelper: RestaurantPreferenceHelper(
                  sharedPreference: SharedPreferences.getInstance())),
          child: ListView(
            children: [
              Consumer<RestaurantScheduleProvider>(
                builder: (context, provider, child) {
                  return ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Icon(
                        Icons.notifications,
                        color: mainColor,
                      ),
                    ),
                    title: Text(
                      'Restaurant Notification',
                      style: amberTextFont,
                    ),
                    subtitle: Text(
                      'Notifify me at 11 A.M',
                      style: amberTextFont,
                    ),
                    trailing: Switch.adaptive(
                      value: provider.isSchedule,
                      onChanged: (value) async {
                        provider.scheduleRestaurant(value);
                      },
                      activeColor: mainColor,
                      activeTrackColor: Colors.grey,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
