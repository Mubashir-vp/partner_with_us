// ignore_for_file: unused_field

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({
    super.key,
  });
  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController contactcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController fssaicodecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: HexColor(
          "#FFBB38",
        ),
        elevation: 0,
        title: Text(
          "Partner With Us",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                SizedBox(height: w / 13),
                const SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: textFormFied(
                    icon: Icons.person,
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
                    icon: Icons.phone,
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
                    icon: Icons.email,
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
                    icon: Icons.password,
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
                    icon: Icons.location_city,
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
                    icon: Icons.feed,
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 80.0,
                    right: 80,
                  ),
                  child: TextButton(
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
                ),
              ],
            ),
            CustomPaint(
              painter: MyPainter(),
              child: Container(height: 0),
            ),
          ],
        ),
      ),
    );
  }
}

textFormFied(
    {TextEditingController? controller,
    required int maxline,
    required IconData icon,
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
      prefixIcon: Icon(icon),
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
    required IconData icon,
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
      prefixIcon: Icon(icon),
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

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = HexColor("#FFBB38")
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = HexColor("#FFBB38")
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
