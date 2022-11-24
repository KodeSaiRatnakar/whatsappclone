import '../imports.dart';

class PhoneNumberEntryScreen extends StatelessWidget {
  PhoneNumberEntryScreen({Key? key});

  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color themeBackgroundColor = Theme.of(context).backgroundColor;
    Color themePrimaryColor = Theme.of(context).primaryColor;
    TextStyle themeTextStyle =
        Theme.of(context).textTheme.bodyLarge as TextStyle;
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeBackgroundColor,
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
                  style: themeTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: themePrimaryColor,
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
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FittedBox(
                child: Text(
                  "WhatsApp will need to verify to your phone number.",
                  style: themeTextStyle.copyWith(
                    color: themePrimaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: mediaSize.width * 0.75,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(
                        flex: 5,
                      ),
                      Text(
                        "India",
                        style: TextStyle(
                          fontSize: 20,
                          color: themePrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.green,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: mediaSize.height * 0.1,
                    child: Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: mediaSize.width * 0.15,
                          child: Column(
                            children: [
                              const Spacer(),
                              Text(
                                "+91",
                                style: TextStyle(
                                  color: themePrimaryColor,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              // ignore: prefer_const_constructors
                              Divider(
                                color: Colors.green,
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 1.5,
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 2,
                          ),
                          width: mediaSize.width * 0.4,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                              controller: phoneNumberController,
                              onChanged: ((value) {
                                formKey.currentState!.validate();
                              }),
                              validator: ((value) {
                                if (value?.length == 10) {
                                  return null;
                                } else {
                                  return "Enter Correct Number";
                                }
                              }),
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.green,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                  fontSize: 10,
                                ),
                                hintText: "Phone number",
                                hintStyle: TextStyle(
                                  color: themePrimaryColor,
                                  fontSize: 12,
                                ),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.green,
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  showIndicator(context);
                  signIn(phoneNumberController.text, context);
                } else {
                  signIn(phoneNumberController.text, context);
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Next"),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

void showIndicator(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: Colors.green,
      ),
    ),
  );
}

Future signIn(String number, BuildContext context) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: "+91$number",
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken) {
      Get.to(
        () => OtpEntryScreen(
          verificationId: verificationId,
          phoneNum: number,
        ),
      );
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      Get.toEnd(
        () => PhoneNumberEntryScreen(),
      );
    },
  );
}
