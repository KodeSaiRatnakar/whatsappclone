import './imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool isLogedIn = false;

  Future<bool> loginStatus() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          isLogedIn = false;
        } else {
          isLogedIn = true;
        }
      },
    );

    return isLogedIn;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loginStatus(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            const Center(
                child:
                    CircularProgressIndicator(backgroundColor: Colors.green));
          }

          return GetMaterialApp(
            initialBinding: InternetConnectionBinding(),
            debugShowCheckedModeBanner: false,
            darkTheme: UserTheme.darkTheme,
            theme: UserTheme.lightTheme,
            themeMode: ThemeMode.dark,
            home: !isLogedIn ? const Home() : const WelcomeScreen(),
            routes: {
              "/welcome": (context) => const WelcomeScreen(),
              "/phone_number_entry_screen": (context) =>
                  PhoneNumberEntryScreen(),
              "/home": (context) => const Home(),
            },
          );
        });
  }
}
