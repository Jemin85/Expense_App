import 'package:expense_tracker/Common/button.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Common().textFormField(_emailController, TextInputAction.next,
                TextInputType.emailAddress, 'Email'),
            const SizedBox(height: 20),
            Common().textFormField(_passController, TextInputAction.done,
                TextInputType.text, 'Password'),
            const SizedBox(height: 20),
            SizedBox(
              width: width,
              child: Common().elevatedButton(
                  'Login', Colors.white, const Color(0xff7F3DFF), () => null),
            ),
            TextButton(
              child: const Text('Forgot password?',
                  style: TextStyle(fontSize: 16, color: Color(0xff7F3DFF))),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Dont't have an account yet?"),
                TextButton(
                  child: const Text('Sign Up',
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
