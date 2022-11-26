import '../imports.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: AppBar(
        backgroundColor: themeData.primaryColor.withOpacity(0.1),
        title: Text(
          'WhatsApp',
          style: TextStyle(
            color: themeData.primaryColor.withOpacity(0.5),
          ),
        ),
        actions: [
          appBarActions(
            Icons.camera_alt_outlined,
            () {},
            themeData.primaryColor,
          ),
          appBarActions(
            Icons.search,
            () {},
            themeData.primaryColor,
          ),
          appBarActions(
            Icons.more_vert,
            () {},
            themeData.primaryColor,
          ),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: []),
    );
  }
}

Widget appBarActions(IconData icon, Function function, Color color) {
  return IconButton(
    onPressed: function(),
    icon: Icon(
      icon,
      color: color.withOpacity(0.7),
    ),
  );
}
