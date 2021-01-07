part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen_page';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _durationTime = new Duration(seconds: 2);
    return new Timer(_durationTime, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacementNamed(context, ListPageRestaurant.routeName);
  }

  @override
  initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/chef.png'),
            )),
          )),
          SizedBox(
            height: 15,
          ),
          Text(
            'Find Resto',
            style: GoogleFonts.dancingScript(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
