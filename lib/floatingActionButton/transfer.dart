import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Transfer'),
          centerTitle: true,
          backgroundColor: const Color(0xff0077FF),
          elevation: 0),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 50, left: 20),
                decoration: const BoxDecoration(color: Color(0xff0077FF)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('How much?',
                        style: TextStyle(color: Colors.grey[300])),
                    const SizedBox(height: 15),
                    const Text('Rs. 0',
                        style: TextStyle(color: Colors.white, fontSize: 50))
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 180),
              padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text('Continue'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: const Color(0xff7F3DFF),
                        padding: const EdgeInsets.symmetric(vertical: 20)),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
