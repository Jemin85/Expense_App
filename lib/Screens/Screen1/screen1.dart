import 'package:expense_tracker/Screens/Screen1/notifi.dart';
import 'package:expense_tracker/provider/darkTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int groupValue = 0;
  String dropdownValue = 'January';
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  var items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'Octomber',
    'November',
    'December'
  ];

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 4.9),
      _ChartData('Aus', 11),
      _ChartData('NZ', 10.3),
      _ChartData('SA', 7.1),
      _ChartData('USA', 14.8),
      _ChartData('WI', 22),
      _ChartData('ID', 4.9),
      _ChartData('UAE', 18.4),
      _ChartData('DC', 7.9),
      _ChartData('US', 35),
      _ChartData('UA', 32.8),
      _ChartData('AA', 33.5),
      _ChartData('BB', 31.2),
      _ChartData('CC', 32.9),
      _ChartData('DD', 40.9),
      _ChartData('EE', 35.7),
      _ChartData('FF', 39.2),
      _ChartData('GG', 36.1),
    ];
    _tooltip = TooltipBehavior(enable: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffFEF6E7),
          elevation: 0,
          leading: const Icon(
            Icons.person,
            color: Color.fromARGB(255, 189, 126, 126),
          ),
          title: const Text(
            "My Expense/Income",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const ImageIcon(AssetImage('assets/notification.png'),
                  size: 35, color: Color(0xff7F3DFF)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Notifi()));
              },
            )
          ]),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Color(0xffFEF6E7),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Column(children: [
                const SizedBox(height: 10),
                const Text('Account balance',
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 5),
                const Text('Rs. 100', style: TextStyle(fontSize: 30)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff00A86B),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () async {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.account_balance_wallet_outlined,
                                    size: 30),
                                SizedBox(width: 20),
                                Expanded(
                                    child: Text(
                                  'Buy',
                                  style: TextStyle(fontSize: 18),
                                ))
                              ]),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffFD3C4A),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () async {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.account_balance_wallet_outlined,
                                    size: 30),
                                SizedBox(width: 20),
                                Expanded(
                                    child: Text(
                                  'Sell',
                                  style: TextStyle(fontSize: 18),
                                ))
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text('Spend Frequency',
                  style: TextStyle(
                      color: themeProvider.isDark ? Colors.white : Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
            ),
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  isVisible: false),
              primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 100,
                  interval: 20,
                  majorGridLines: const MajorGridLines(width: 0),
                  isVisible: false),
              tooltipBehavior: _tooltip,
              series: <ChartSeries<_ChartData, String>>[
                SplineSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Expense',
                    color: Color.fromARGB(255, 91, 81, 236))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
