import 'package:expense_tracker/Common/button.dart';
import 'package:flutter/material.dart';
import 'OTPscreen.dart';

class PhoneAuthForm extends StatefulWidget {
  const PhoneAuthForm({Key? key}) : super(key: key);

  @override
  _PhoneAuthFormState createState() => _PhoneAuthFormState();
}

class _PhoneAuthFormState extends State<PhoneAuthForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
        centerTitle: true,
        backgroundColor: const Color(0xff7F3DFF),
        elevation: 0,
      ),
      body: Container(
        height: height,
        width: width,
        color: const Color(0xff7F3DFF),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Text('montra',
                style: TextStyle(
                    color: Colors.white, fontSize: 60, fontFamily: 'Lobster')),
            Container(
              height: height / 2.3,
              margin: const EdgeInsets.only(top: 200),
              padding: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Phone Authentication',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Color(0xff7F3DFF)),
                  ),
                  Common().textFormField(_controller, TextInputAction.done,
                      TextInputType.number, 'Phone No.'),
                  SizedBox(
                    width: width,
                    child: Common().elevatedButton(
                      'Next',
                      Colors.white,
                      Color(0xff7F3DFF),
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OTPScreen(_controller.text)));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
