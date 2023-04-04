import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Screen3Income extends StatefulWidget {
  const Screen3Income({Key? key}) : super(key: key);

  @override
  State<Screen3Income> createState() => _Screen3ExpenseState();
}

class _Screen3ExpenseState extends State<Screen3Income> {
  double sum = 0.0;
  double income = 0.0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Income').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                return streamSnapshot.data == null
                    ? const Text("NO Data Found")
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: streamSnapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          if (streamSnapshot.data!.docs[index]['title'] ==
                                  'Salary' ||
                              streamSnapshot.data!.docs[index]['title'] ==
                                  'Passive Income') {
                            QueryDocumentSnapshot pay =
                                streamSnapshot.data!.docs[index];

                            income = sum += double.parse(pay['Amount']);
                          } else {
                            sum == 0;
                          }
                          //   print(income.toString());
                          return Column(
                            children: [
                              Container(
                                child: streamSnapshot.data!.docs[index]['title'] == 'Salary' ||
                                        streamSnapshot.data!.docs[index]['title'] ==
                                            'Passive Income'
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
                                                                'assets/shoping.png')
                                                            : streamSnapshot.data!.docs[index]['title'] ==
                                                                    'Transport'
                                                                ? const AssetImage(
                                                                    'assets/transport.png')
                                                                : streamSnapshot
                                                                            .data!
                                                                            .docs[index]['title'] ==
                                                                        'Passive Income'
                                                                    ? const AssetImage('assets/passive-income.png')
                                                                    : const AssetImage('assets/subscription.png')),
                                          ),
                                        ),
                                        title: Text(streamSnapshot.data!.docs[index]['title'],
                                            style:
                                                const TextStyle(fontSize: 17)),
                                        subtitle: Text(
                                            streamSnapshot.data!.docs[index]
                                                ['Description'],
                                            style:
                                                const TextStyle(fontSize: 13)),
                                        trailing:
                                            Text(streamSnapshot.data!.docs[index]['Amount'],
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.green)),
                                        onTap: () {})
                                    : null,
                              ),
                            ],
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
