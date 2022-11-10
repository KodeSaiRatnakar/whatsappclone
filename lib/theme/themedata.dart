import '../imports.dart';

class UserTheme {
  static ThemeData darkTheme = ThemeData(
    backgroundColor: Colors.black,
    textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 35),
        bodySmall: TextStyle(color: Colors.white, fontSize: 20)),
  );
  static ThemeData lightTheme = ThemeData(
      backgroundColor: Colors.white,
      textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.green, fontSize: 35),
          bodySmall: TextStyle(color: Colors.black, fontSize: 20)));
}
