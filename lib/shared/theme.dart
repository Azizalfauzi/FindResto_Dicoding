part of 'shared.dart';

Color mainColor = Colors.amber;
Color secondaryColor = Colors.grey;
Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);
TextStyle amberTextFont = GoogleFonts.poppins().copyWith(color: Colors.amber);
TextStyle greyTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300);
TextStyle whiteTextFont = GoogleFonts.poppins().copyWith(color: Colors.white);
