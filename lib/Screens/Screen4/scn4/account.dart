import 'package:flutter/material.dart';
import '../../../add_new_wallet.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Account',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  color: Color(0xff8F56FF),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Column(children: [
                Text(
                  'Account Balance',
                  style: TextStyle(color: Colors.grey[200], fontSize: 13),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Rs. 9400",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                children: [
                  ListTile(
                      leading: Container(
                        height: 70,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/wallet.png'))),
                      ),
                      title: const Text(
                        'Wallet',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: const Text('Rs. 400',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600)),
                      onTap: () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTile(
                      leading: Container(
                        height: 70,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/chase.png'))),
                      ),
                      title:
                          const Text('Chase', style: TextStyle(fontSize: 17)),
                      trailing: const Text('Rs. 810',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600)),
                      onTap: () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTile(
                      leading: Container(
                        height: 70,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/citi.png'))),
                      ),
                      title: const Text('Citi', style: TextStyle(fontSize: 17)),
                      trailing: const Text('Rs. 6000',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600)),
                      onTap: () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTile(
                      leading: Container(
                        height: 70,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/paypal.png'))),
                      ),
                      title:
                          const Text('Paypal', style: TextStyle(fontSize: 17)),
                      trailing: const Text('Rs. 1250',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600)),
                      onTap: () {}),
                  const Divider(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: width,
                    child: ElevatedButton(
                      child: const Text('+ Add new wallet'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: const Color(0xff7F3DFF),
                          padding: const EdgeInsets.symmetric(vertical: 20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddNewWallet()));
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
