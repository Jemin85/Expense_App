import 'package:expense_tracker/Screens/Screen1/screen1.dart';
import 'package:expense_tracker/Screens/Screen3/screen3.dart';
import 'package:expense_tracker/Screens/Screen4/screen4.dart';
import 'package:expense_tracker/Screens/screen5/other1.dart';
import 'package:expense_tracker/floatingActionButton/income.dart';
import 'package:expense_tracker/provider/darkTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../floatingActionButton/expenses.dart';
import '../floatingActionButton/transfer.dart';
import 'Screen2/screen2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool toggle = false;
  late AnimationController _controller;
  int _currentIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const Screen1();
      case 1:
        return const Screen2();
      case 2:
        return const Screen3();
      case 3:
        return const Screen4();
      // case 4:
      //   return const Xslider();

      default:
        return const Text("Error");
    }
  }

  Alignment alignment1 = const Alignment(0.0, 1.0);
  Alignment alignment2 = const Alignment(0.0, 1.0);
  Alignment alignment3 = const Alignment(0.0, 1.0);
  double size1 = 10;

  @override
  void initState() {
    late Animation _animation;
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350),
        reverseDuration: const Duration(milliseconds: 275));
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          elevation: 1,
          backgroundColor: const Color(0xff7F3DFF),
          onPressed: () {
            setState(() {
              toggle = !toggle;
            });
            if (toggle) {
              setState(() {
                size1 = 55;
              });
              _controller.forward();
              Future.delayed(const Duration(milliseconds: 5), () {
                alignment1 = const Alignment(-0.4, 0.6);
              });
              Future.delayed(const Duration(milliseconds: 100), () {
                alignment2 = const Alignment(0.0, 0.4);
              });
              Future.delayed(const Duration(milliseconds: 300), () {
                alignment3 = const Alignment(0.4, 0.6);
              });
            } else {
              _controller.reverse();
              alignment1 = const Alignment(0.0, 0.9);
              alignment2 = const Alignment(0.0, 0.9);
              alignment3 = const Alignment(0.0, 0.9);
              setState(() {
                size1 = 10;
              });
            }
          },
          child:  const Icon(Icons.add)),
      body: Stack(
        children: [
          _getDrawerItemWidget(_currentIndex),
          AnimatedAlign(
            duration: toggle
                ? const Duration(milliseconds: 275)
                : const Duration(milliseconds: 800),
            curve: toggle ? Curves.easeIn : Curves.easeOut,
            alignment: alignment1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Expenses()));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 275),
                curve: toggle ? Curves.easeIn : Curves.easeOut,
                height: size1,
                width: size1,
                decoration: BoxDecoration(
                    color: const Color(0xffFD3C4A),
                    borderRadius: BorderRadius.circular(50)),
                child: ImageIcon(const AssetImage('assets/expense.png'),
                    color: Colors.white, size: toggle ? 30 : 10),
              ),
            ),
          ),
          AnimatedAlign(
            duration: toggle
                ? const Duration(milliseconds: 275)
                : const Duration(milliseconds: 800),
            curve: toggle ? Curves.easeIn : Curves.easeOut,
            alignment: alignment3,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Income()));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 275),
                curve: toggle ? Curves.easeIn : Curves.easeOut,
                height: size1,
                width: size1,
                decoration: BoxDecoration(
                    color: const Color(0xff00A86B),
                    borderRadius: BorderRadius.circular(50)),
                child: ImageIcon(const AssetImage('assets/income.png'),
                    color: Colors.white, size: toggle ? 30 : 10),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          selectedItemColor: const Color(0xff7F3DFF),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/home.png'), size: 35),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/transaction.png'), size: 35),
                label: 'Transacion'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/pie-chart.png'), size: 35),
                label: 'Budget'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/user.png'), size: 35),
                label: 'Profile'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.person, size: 35), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
