import 'package:expense_tracker/Screens/Screen3/favourite.dart';
import 'package:expense_tracker/Screens/Screen3/favy.dart';
import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  const Other({Key? key}) : super(key: key);

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> with SingleTickerProviderStateMixin {
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
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
          centerTitle: true,
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
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: const Color(0xff7F3DFF),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: ('Favorite')),
                      Tab(text: ('Favy')),
                    ],
                  )),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [Favourite(), Favy()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
