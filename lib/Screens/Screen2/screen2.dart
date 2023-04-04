import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Screens/Screen2/storyview.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String dropdownValue = 'January';
  var items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'Octomber',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Your transaction',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20)),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Income')
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    return streamSnapshot.data == null
                        ? const Text("No Data Found")
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: streamSnapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                    onLongPress: () {
                                      setState(() {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'AlertDialog Title'),
                                                content: const Text(
                                                    'AlertDialog description'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Cancel'),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      FirebaseFirestore.instance
                                                          .collection("Income")
                                                          .doc(streamSnapshot
                                                                  .data
                                                                  ?.docs[index]
                                                              ['Amount'])
                                                          .delete();
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            });
                                      });
                                    },
                                    leading: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: streamSnapshot.data!
                                                        .docs[index]['title'] ==
                                                    'Salary'
                                                ? const AssetImage(
                                                    'assets/salary.png')
                                                : streamSnapshot.data!.docs[index]
                                                            ['title'] ==
                                                        'Food'
                                                    ? const AssetImage(
                                                        'assets/food.png')
                                                    : streamSnapshot.data!
                                                                    .docs[index]
                                                                ['title'] ==
                                                            'Shopping'
                                                        ? const AssetImage(
                                                            'assets/shopping.png')
                                                        : streamSnapshot.data!
                                                                        .docs[index]
                                                                    ['title'] ==
                                                                'Transport'
                                                            ? const AssetImage(
                                                                'assets/car.png')
                                                            : streamSnapshot
                                                                        .data!
                                                                        .docs[index]['title'] ==
                                                                    'Passive Income'
                                                                ? const AssetImage('assets/passive-income.png')
                                                                : const AssetImage('assets/subscription.png')),
                                      ),
                                    ),
                                    title: Text(streamSnapshot.data!.docs[index]['title'],
                                        style: const TextStyle(fontSize: 17)),
                                    subtitle: Text(
                                        streamSnapshot.data!.docs[index]
                                            ['Description'],
                                        style: const TextStyle(fontSize: 13)),
                                    trailing: Text(
                                        streamSnapshot.data!.docs[index]
                                            ['Amount'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: streamSnapshot.data!.docs[index]
                                                            ['title'] ==
                                                        'Salary' ||
                                                    streamSnapshot.data!.docs[index]
                                                            ['title'] ==
                                                        'Passive Income'
                                                ? Colors.green
                                                : Colors.red)),
                                    onTap: () {}),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
