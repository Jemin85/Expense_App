import 'package:expense_tracker/provider/darkTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class Notifi extends StatelessWidget {
  const Notifi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',
            style: TextStyle(
                color: themeProvider.isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.w400)),
        backgroundColor: Color(0xffFEF6E7),
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
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
                      title: const Text('Shopping budget has exceeds the..'),
                      subtitle: const Text(
                          'Your shopping budget has exccedsthe limit..'),
                      trailing: const Text('19.30'),
                      onTap: () {}),
                  ListTile(
                      title: const Text('Utilities budget has exceeds the..'),
                      subtitle: const Text(
                          'Your utilities budget has exccedsthe limit..'),
                      trailing: const Text('19.30'),
                      onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
