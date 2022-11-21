import '../imports.dart';

class OtpEntryScreen extends StatelessWidget {
  final String verificationId;

  const OtpEntryScreen({required this.verificationId, super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(flex: 5),
                Text(
                  "Verify your Phone Number",
                  style: themeData.textTheme.bodyLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: themeData.primaryColor,
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                  ),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
