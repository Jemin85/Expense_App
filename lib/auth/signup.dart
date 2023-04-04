import 'dart:ui';

import 'package:expense_tracker/Common/button.dart';
import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Sign Up',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
          centerTitle: true),
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Common().textFormField(_email, TextInputAction.next,
                TextInputType.emailAddress, 'Email'),
            const SizedBox(height: 20),
            Common().textFormField(
                _pass, TextInputAction.done, TextInputType.text, 'Password'),
            const SizedBox(height: 20),
            SizedBox(
              width: width,
              child: Common().elevatedButton(
                  'Sign up', Colors.white, const Color(0xff7F3DFF), () => null),
            ),
            Row(
              children: [
                const Text("Already have an account?"),
                TextButton(
                  child: const Text('Login',
                      style: TextStyle(fontSize: 16, color: Color(0xff7F3DFF))),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
