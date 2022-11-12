import '../imports.dart';

class UserTheme {
  static ThemeData darkTheme = ThemeData(
    backgroundColor: Colors.black,
    primaryColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 35,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.green,
        fontSize: 35,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
