import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Common/button.dart';
import 'package:expense_tracker/Screens/Screen2/screen2.dart';
import 'package:expense_tracker/provider/transfervar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  TextEditingController sumController = TextEditingController();

  double num1 = 0.0;
  double num2 = 0.0;
  double sum = 0.0;
  double expense = 0;
  String dropdownValue = 'Transport';
  var items = ['Transport', 'Shopping', 'Subscription', 'Food'];

  @override
  void initState() {
    setState(() {
      expense = Provider.of<TransferVar>(context, listen: false).expense;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TransferVar>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Expense'),
          centerTitle: true,
          backgroundColor: const Color(0xffFD3C4A),
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
                  decoration: const BoxDecoration(color: Color(0xffFD3C4A)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('How much?',
                          style: TextStyle(color: Colors.grey[300])),
                      const SizedBox(height: 15),
                      Text(expense.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 50))
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
