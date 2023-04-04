import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Common/button.dart';
import 'package:expense_tracker/Screens/Screen2/screen2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Income extends StatefulWidget {
  const Income({Key? key}) : super(key: key);

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String dropdownValue = 'Salary';
  var items = ['Salary', 'Passive Income'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Income'),
          centerTitle: true,
          backgroundColor: const Color(0xff00A86B),
          elevation: 0),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  decoration: const BoxDecoration(color: Color(0xff00A86B)),
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
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      child: DropdownButton<String>(
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
                    Common().textFormField(_controller1, TextInputAction.next,
                        TextInputType.name, 'Description'),
                    const SizedBox(height: 20),
                    Common().textFormField(_controller2, TextInputAction.done,
                        TextInputType.number, 'Amount'),
                    const SizedBox(height: 20),
                    Common().elevatedButton(
                        'Continue', Colors.white, const Color(0xff7F3DFF), () {
                      if (_formkey.currentState!.validate()) {
                        if (_formkey.currentState!.validate()) {
                          FirebaseFirestore.instance.collection('Income').add({
                            'title': dropdownValue,
                            'Description': _controller1.text,
                            'Amount': _controller2.text,
                          }).then((onValue) {
                            Fluttertoast.showToast(msg: 'Added in collection');
                          }).catchError((e) {
                            Fluttertoast.showToast(msg: e);
                            _controller1.clear();
                            _controller2.clear();
                          });
                          setState(
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen2()));
                            },
                          );
                        }
                      }
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
