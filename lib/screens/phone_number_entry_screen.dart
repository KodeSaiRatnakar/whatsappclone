import '../imports.dart';

class PhoneNumberEntryScreen extends StatelessWidget {
  PhoneNumberEntryScreen({super.key});
  final formKey = GlobalKey<FormState>();
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
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Spacer(flex: 5),
              Text(
                "Verify your Phone Number",
                style: themeTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: themePrimaryColor),
              ),
              Spacer(
                flex: 4,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              Spacer(
                flex: 1,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FittedBox(
              child: Text(
                "WhatsApp willneed to verify to your phone number.",
                style: themeTextStyle.copyWith(color: themePrimaryColor),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: mediaSize.width * 0.75,
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(
                      flex: 5,
                    ),
                    Text(
                      "India",
                      style: TextStyle(
                          fontSize: 20,
                          color: themePrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
                Divider(
                  color: Colors.green,
                  thickness: 2,
                ),
                Container(
                  height: mediaSize.height * 0.1,
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        width: mediaSize.width * 0.15,
                        child: Column(
                          children: [
                            Spacer(),
                            Text(
                              "+91",
                              style: TextStyle(
                                  color: themePrimaryColor, fontSize: 15),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            // ignore: prefer_const_constructors
                            Divider(
                              color: Colors.green,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 1.5,
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: mediaSize.width * 0.4,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.green, width: 2))),
                          child: Form(
                            key: formKey,
                            child: TextFormField(
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(fontSize: 10),
                                  hintText: "Phone number",
                                  hintStyle: TextStyle(
                                      color: themePrimaryColor, fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          )),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print("yes");
                } else {
                  print("No");
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Next"),
              )),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
