import 'package:expense_tracker/Common/button.dart';
import 'package:flutter/material.dart';

class AddNewWallet extends StatefulWidget {
  const AddNewWallet({Key? key}) : super(key: key);

  @override
  State<AddNewWallet> createState() => _AddNewWalletState();
}

class _AddNewWalletState extends State<AddNewWallet> {
  final TextEditingController _controller = TextEditingController();
  String dropdownValue = 'Paypal';
  var items = ['Paypal', 'Chase', 'Citi', 'Paytm', 'Googlepay', 'Phonepe'];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7F3DFF),
        centerTitle: true,
        title:
            const Text('Edit Account', style: TextStyle(color: Colors.white)),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 50, left: 20),
                decoration: const BoxDecoration(color: Color(0xff7F3DFF)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Balance', style: TextStyle(color: Colors.grey[300])),
                    const SizedBox(height: 15),
                    const Text('Rs.2400',
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
                  Common().textFormField(_controller, TextInputAction.next,
                      TextInputType.name, 'Description'),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items:
                          items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Common().elevatedButton(
                      'Continue', Colors.white, const Color(0xff7F3DFF), () {}),
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
