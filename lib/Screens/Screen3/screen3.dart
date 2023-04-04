import 'package:expense_tracker/Screens/Screen3/screen3Expense.dart';
import 'package:expense_tracker/Screens/Screen3/screen3Income.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Financial Report',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
          child: Column(
            children: [
              Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xff7F3DFF),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: ('Expense')),
                      Tab(text: ('Income')),
                    ],
                  )),
              const SizedBox(height: 15),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Screen3Expense(),
                    Screen3Income(),
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
