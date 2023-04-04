import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Screen3Expense extends StatefulWidget {
  const Screen3Expense({Key? key}) : super(key: key);

  @override
  State<Screen3Expense> createState() => _Screen3IncomeState();
}

class _Screen3IncomeState extends State<Screen3Expense> {
  double sum = 0.0;
  double expense = 0.0;
  var totalCartValue = 0;
  List<bool> isFav = [];
  List favoriteDataList = [];
  List mainDataList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Income').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        return streamSnapshot.data == null
            ? const Text("NO Data Found")
            : SizedBox(
                height: height,
                width: width,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: streamSnapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          if (streamSnapshot.data!.docs[index]['title'] ==
                                  'Shopping' ||
                              streamSnapshot.data!.docs[index]['title'] ==
                                  'Transport' ||
                              streamSnapshot.data!.docs[index]['title'] ==
                                  'Food' ||
                              streamSnapshot.data!.docs[index]['title'] ==
                                  'Subscription') {
                            QueryDocumentSnapshot pay =
                                streamSnapshot.data!.docs[index];

                            expense = sum += double.parse(pay['Amount']);
                          } else {
                            sum == 0;
                          }
                          return Column(
                            children: [
                              Container(
                                child: streamSnapshot.data!.docs[index]['title'] == 'Shopping' ||
                                        streamSnapshot.data!.docs[index]['title'] ==
                                            'Transport' ||
                                        streamSnapshot.data!.docs[index]['title'] ==
                                            'Food' ||
                                        streamSnapshot.data!.docs[index]['title'] ==
                                            'Subscription'
                                    ? ListTile(
                                        leading: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: streamSnapshot.data!
                                                                .docs[index]
                                                            ['title'] ==
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
                                                            : streamSnapshot.data!.docs[index]['title'] ==
                                                                    'Transport'
                                                                ? const AssetImage(
                                                                    'assets/car.png')
                                                                : streamSnapshot
                                                                            .data!
                                                                            .docs[index]['title'] ==
                                                                        'Passive Income'
                                                                    ? const AssetImage('assets/passiveIncome.png')
                                                                    : const AssetImage('assets/subscription.png')),
                                          ),
                                        ),
                                        title: Text(streamSnapshot.data!.docs[index]['title'],
                                            style:
                                                const TextStyle(fontSize: 17)),
                                        subtitle: Text(streamSnapshot.data!.docs[index]['Description'],
                                            style:
                                                const TextStyle(fontSize: 13)),
                                        trailing: Text(streamSnapshot.data!.docs[index]['Amount'],
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red)),
                                        onTap: () {})
                                    : null,
                              ),
                              //Text(expense.toString())
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
