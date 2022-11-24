import 'package:pinput/pinput.dart';
import '../imports.dart';

class OtpEntryScreen extends StatelessWidget {
  final String verificationId;
  final String phoneNum;

  OtpEntryScreen(
      {required this.verificationId, required this.phoneNum, super.key});

  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Spacer(flex: 1),
                  Text(
                    "Verify OTP",
                    style: themeData.textTheme.bodyLarge?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: themeData.primaryColor,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
              SizedBox(
                height: mediaSize.height * 0.25,
              ),
              Text(
                'OTP is sent to $phoneNum',
                style: TextStyle(
                    color: themeData.primaryColor, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: mediaSize.height * 0.1,
              ),
              Pinput(
                controller: otp,
                length: 6,
                defaultPinTheme: PinTheme(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: themeData.primaryColor),
                    color: themeData.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  textStyle: TextStyle(
                    color: themeData.backgroundColor,
                  ),
                ),
              ),
              SizedBox(
                height: mediaSize.height * 0.05,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.green,
                    ),
                  ),
                  onPressed: () async {
                    if (otp.text.length == 6) {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      showIndicator(context);
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: otp.text,
                      );

                      await auth.signInWithCredential(credential);

                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    }
                  },
                  child: const Text("Verify"))
            ],
          ),
        ),
      ),
    );
  }
}

void showError(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Enter Correct OTP",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
