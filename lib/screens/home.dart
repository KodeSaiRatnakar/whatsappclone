import '../imports.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            bottom: TabBar(
              tabs: [
                tabBarText('CHATS', themeData.primaryColor),
                tabBarText('STATUS', themeData.primaryColor),
                tabBarText('CALLS', themeData.primaryColor)
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "chats",
                      style: TextStyle(color: themeData.primaryColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      "status",
                      style: TextStyle(color: themeData.primaryColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      "calls",
                      style: TextStyle(color: themeData.primaryColor),
                    ),
                  ),
                ],
              )
            ],
          )),
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

Widget tabBarText(String text, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      text,
      style: TextStyle(
        color: color.withOpacity(0.5),
      ),
    ),
  );
}
