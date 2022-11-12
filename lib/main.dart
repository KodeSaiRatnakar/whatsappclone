import 'package:whatsapp/screens/phone_number_entry_screen.dart';

import './imports.dart';
import 'theme/themedata.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: UserTheme.darkTheme,
      theme: UserTheme.lightTheme,
      themeMode: ThemeMode.dark,
      home: PhoneNumberEntryScreen(),
    );
  }
}
