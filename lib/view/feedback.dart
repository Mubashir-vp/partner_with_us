import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedBackscreen extends StatelessWidget {
  FeedBackscreen({
    super.key,
  });
  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(
          "#FFBB38",
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Partner with US",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: HexColor(
                          "#281B13",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: textFormFied(
                    controller: namecontroller,
                    validator: (val) {
                      if (val!.isEmpty || val == "") {
                        return "This field is required";
                      } else {
                        return null;
                      }
                    },
                    action: TextInputAction.next,
                    maxline: 1,
                    keyboardtype: TextInputType.name,
                    text: "Name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: textFormFiedNumber(
                    controller: contactcontroller,
                    maxlength: 10,
                    validator: (val) {
                      if (val!.isEmpty || val == "") {
                        return "This field is required";
                      }
                      if (val.length != 10) {
                        return "Invalid phone number";
                      } else {
                        return null;
                      }
                    },
                    action: TextInputAction.next,
                    maxline: 1,
                    keyboardtype: TextInputType.number,
                    text: "Contact number",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: textFormFied(
                    controller: emailcontroller,
                    validator: (val) {
                      if (val!.isEmpty || val == "") {
                        return "This field is required";
                      } else if (!EmailValidator.validate(val)) {
                        return "Invalid email";
                      } else {
                        return null;
                      }
                    },
                    action: TextInputAction.next,
                    maxline: 1,
                    keyboardtype: TextInputType.emailAddress,
                    text: "Email address",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: textFormFiedNumber(
                    controller: fssaicodecontroller,
                    maxlength: 14,
                    validator: (val) {
                      if (val!.isEmpty || val == "") {
                        return "This field is required";
                      } else if (val.length != 14) {
                        return "Invalid FSSAI code";
                      } else {
                        return null;
                      }
                    },
                    action: TextInputAction.next,
                    maxline: 1,
                    keyboardtype: TextInputType.number,
                    text: "FSSAI code",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: textFormFied(
                    controller: addresscontroller,
                    validator: (val) {
                      if (val!.isEmpty || val == "") {
                        return "This field is required";
                      } else {
                        return null;
                      }
                    },
                    action: TextInputAction.next,
                    maxline: 1,
                    keyboardtype: TextInputType.streetAddress,
                    text: "Address",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: textFormFied(
                    controller: descriptioncontroller,
                    validator: (val) {
                      if (val!.isEmpty || val == "") {
                        return "This field is required";
                      } else {
                        return null;
                      }
                    },
                    action: TextInputAction.done,
                    maxline: 5,
                    keyboardtype: TextInputType.name,
                    text: "Description",
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    HexColor(
                      "#281B13",
                    ),
                  )),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      namecontroller.clear();
                      contactcontroller.clear();
                      emailcontroller.clear();
                      fssaicodecontroller.clear();
                      addresscontroller.clear();
                      descriptioncontroller.clear();
                      showDialog(
                          context: context,
                          builder: (
                            context,
                          ) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(
                                  12,
                                ),
                              )),
                              backgroundColor: HexColor(
                                "#FFBB38",
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Image.asset(
                                      "assets/done.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Thank You for giving Your feedback",
                                          maxLines: 1,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor(
                                                "#281B13",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  },
                  child: const Text(
                    "Submit your Review",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

textFormFied(
    {TextEditingController? controller,
    required int maxline,
    required text,
    required TextInputType keyboardtype,
    required TextInputAction action,
    required String? Function(String?)? validator}) {
  return TextFormField(
    validator: validator,
    textInputAction: action,
    controller: controller,
    maxLines: maxline,
    keyboardType: keyboardtype,
    decoration: InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      
      labelText: text,
      labelStyle: TextStyle(
        color: HexColor(
          "#281B13",
        ),
      ),
    ),
    style: TextStyle(
      color: HexColor(
        "#281B13",
      ),
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  );
}

textFormFiedNumber(
    {TextEditingController? controller,
    required int maxline,
    required text,
    required TextInputType keyboardtype,
    required TextInputAction action,
    required int maxlength,
    required String? Function(String?)? validator}) {
  return TextFormField(
    validator: validator,
    textInputAction: action,
    maxLength: maxlength,
    controller: controller,
    maxLines: maxline,
    keyboardType: keyboardtype,
    decoration: InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          0.0,
        ),
        borderSide: BorderSide(
          color: HexColor(
            "#281B13",
          ),
        ),
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: HexColor(
          "#281B13",
        ),
      ),
    ),
    style: TextStyle(
      color: HexColor(
        "#281B13",
      ),
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  );
}

final TextEditingController namecontroller = TextEditingController();
final TextEditingController contactcontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController fssaicodecontroller = TextEditingController();
final TextEditingController addresscontroller = TextEditingController();
final TextEditingController descriptioncontroller = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey();
