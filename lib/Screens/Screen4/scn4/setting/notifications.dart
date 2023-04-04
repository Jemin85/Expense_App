import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Notificationn extends StatefulWidget {
  const Notificationn({Key? key}) : super(key: key);

  @override
  State<Notificationn> createState() => _NotificationState();
}

class _NotificationState extends State<Notificationn> {
  bool _expenseAlert = true;
  bool _budget = true;
  bool _tip = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Settings',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: true),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 475),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  ListTile(
                    title: const Text('Expense Alert'),
                    subtitle:
                        const Text("Get notification about you're expense"),
                    trailing: CupertinoSwitch(
                        value: _expenseAlert,
                        onChanged: (bool value) {
                          setState(() {
                            _expenseAlert = value;
                          });
                        }),
                    onTap: () {
                      setState(() {
                        _expenseAlert = !_expenseAlert;
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Budget'),
                    subtitle: const Text(
                        "Get notification when you're budget exceeding the limit"),
                    trailing: CupertinoSwitch(
                        value: _budget,
                        onChanged: (bool value) {
                          setState(() {
                            _budget = value;
                          });
                        }),
                    onTap: () {
                      setState(() {
                        _budget = !_budget;
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Tips & Articles'),
                    subtitle: const Text(
                        'Small and useful pieces of practical financial advice'),
                    trailing: CupertinoSwitch(
                        value: _tip,
                        onChanged: (bool value) {
                          setState(() {
                            _tip = value;
                          });
                        }),
                    onTap: () {
                      setState(() {
                        _tip = !_tip;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
