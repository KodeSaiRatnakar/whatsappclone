import './imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InternetConnectionBinding(),
      debugShowCheckedModeBanner: false,
      darkTheme: UserTheme.darkTheme,
      theme: UserTheme.lightTheme,
      themeMode: ThemeMode.dark,
      home: const WelcomeScreen(),
      routes: {
        "/welcome": (context) => const WelcomeScreen(),
        "/phone_number_entry_screen": (context) => PhoneNumberEntryScreen(),
      },
    );
  }
}
