import '../imports.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    InternetConnectionStatus internetConnectivity =
        Get.find<InternetConnectionStatus>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Obx(
        () {
          if (!internetConnectivity.isIneternetAvailble.value) {
            return Center(
              child: Text(
                "No Internet",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        "Welcome to WhatsApp",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 30),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius:
                            defaultTargetPlatform == TargetPlatform.android ||
                                    defaultTargetPlatform == TargetPlatform.iOS
                                ? mediaSize.width * 0.3
                                : mediaSize.width * 0.1,
                        child: const Image(
                          image: AssetImage("assets/whatsapp.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Spacer(),
                      const Spacer(),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 15),
                          children: const [
                            TextSpan(text: "Read our "),
                            TextSpan(
                              text: "Privacy Policy ",
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ),
                            TextSpan(
                              text: "Tap 'Agree and Continue' to accept the ",
                            ),
                            TextSpan(
                              text: "Terms of Service.",
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => PhoneNumberEntryScreen(),
                          );
                        },
                        child: Container(
                          width: defaultTargetPlatform ==
                                      TargetPlatform.android ||
                                  defaultTargetPlatform == TargetPlatform.iOS
                              ? mediaSize.width * 0.7
                              : mediaSize.width * 0.2,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              "AGREE AND CONTINUE",
                              style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
