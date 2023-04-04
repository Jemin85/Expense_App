import 'package:expense_tracker/Screens/homePage.dart';
import 'package:expense_tracker/provider/darkTheme.dart';
import 'package:expense_tracker/provider/favoriteProvider.dart';
import 'package:expense_tracker/provider/transfervar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransferVar()),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeModel(),
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeModel>(context);
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme:
                    themeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
                home: const HomePage()
                // SplashScreen(
                //   seconds: 2,
                //   backgroundColor: const Color(0xff7F3DFF),
                //   title: const Text('montra',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 60,
                //           fontFamily: 'Lobster')),
                //   useLoader: true,
                //   navigateAfterSeconds: const HomePage(),
                // ),
                );
          },
        )
      ],
    );
  }
}
