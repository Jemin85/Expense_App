import 'package:expense_tracker/Screens/Screen4/scn4/setting/notifications.dart';
import 'package:expense_tracker/provider/darkTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../Screen1/notifi.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> with SingleTickerProviderStateMixin {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Settings',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
          centerTitle: false),
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
                      title: const Text('Currency'),
                      subtitle: const Text('USD'),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {}),
                  ListTile(
                      title: const Text('Language'),
                      subtitle: const Text('English'),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {}),
                  ListTile(
                      title: const Text('Security'),
                      subtitle: const Text('Fingerprint'),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {}),
                  ListTile(
                      title: const Text('Notification'),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifi()));
                      }),
                  ListTile(
                      title: const Text('About'),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {}),
                  ListTile(
                      title: const Text('Help'),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
