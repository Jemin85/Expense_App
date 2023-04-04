import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransferVar extends ChangeNotifier {
  double sum = 0.0;
  double _expense = 0.0;

  double get expense => _expense;

  getData(List<QueryDocumentSnapshot<Object?>>? data) {
    print("data$data");
    for (int i = 0; i < data!.length; i++) {
      if (data[i]["title"] == "Shopping" ||
          data[i]["title"] == "Shopping" ||
          data[i]["title"] == "Shopping" ||
          data[i]["title"] == "Shopping") {
        var pay = data[i]["Amount"];
        _expense = sum += pay["Amount"];
        notifyListeners();
      } else {
        sum = 0;
      }
    }
    print("_expense  $_expense");
    StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Income').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return ListView.builder(
              itemCount: streamSnapshot.data?.docs.length,
              itemBuilder: (context, index) {
                if (streamSnapshot.data!.docs[index]['title'] == 'Shopping' ||
                    streamSnapshot.data!.docs[index]['title'] == 'Transport' ||
                    streamSnapshot.data!.docs[index]['title'] == 'Food' ||
                    streamSnapshot.data!.docs[index]['title'] ==
                        'Subscription') {
                  var pay = streamSnapshot.data!.docs[index];
                  _expense = sum += double.parse(pay['Amount']);
                } else {
                  sum == 0;
                }
    
                notifyListeners();
                print(expense);
                return Container();
              });
        });
  }
}
