import 'dart:ui';

import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart/developer_series.dart';
import 'chart/developer_chart.dart';
import 'package:pie_chart/pie_chart.dart';
import 'line_chart/line_chart_sample2.dart';

class Publikasi extends StatefulWidget {
  const Publikasi({Key? key}) : super(key: key);

  @override
  State<Publikasi> createState() => _PublikasiState();
}

class _PublikasiState extends State<Publikasi> {
  final List<DeveloperSeries> data = [
    DeveloperSeries(
      year: "FPMIPA",
      developers: 3.10,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
    DeveloperSeries(
      year: "FPTK",
      developers: 3.59,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: "FPOK",
      developers: 2.7,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: "FPBS",
      developers: 1.6,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
    DeveloperSeries(
      year: "FPIPS",
      developers: 3.9,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: "FIP",
      developers: 2.7,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
    DeveloperSeries(
      year: "FPEB",
      developers: 3.8,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
  ];
  Map<String, double> dataMap = {
    "FPMIPA": 500,
    "FPTK": 150,
    "FPOK": 15,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(320.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 19, 54, 232),
                Color(0xFF060E39)
              ])),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text('Publikasi'),
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ListView(
                children: [
                  const SizedBox(height: 55),
                  Container(
                    height: 250,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          children: <Widget>[
                            Text('Sebaran Publikasi per Fakultas',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 10),
                            PieChart(
                              dataMap: dataMap,
                              chartType: ChartType.ring,
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3,
                              legendOptions: const LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.left,
                                showLegends: true,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: true,
                                decimalPlaces: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.black12),
            const Text(
              "Trend Publikasi Fakultas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            Text(
              "Jan 2022 - Jul 2022",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Expanded(
              child: LineChartSample2(),
            ),
            const Divider(color: Colors.black12),
            const SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Text('Perbandingan 2021',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            )),
                        LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent: 0.4,
                          progressColor: Colors.green,
                          width: 200,
                        ),
                        const Text(
                          "100.000 dari 65.000",
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 14.0),
                        ),
                      ],
                    ),
                    const Text(
                      '+35%',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Prodi Terbaik',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        Text(
                          "(Publikasi)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/crown.png',
                          width: 45,
                        ),
                        const Text(
                          "Ilmu Komputer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.black12),
            const Text(
              "Perbandingan Antar Fakultas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("FPMIPA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )),
                Text("FPTK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text("3.75",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    )),
                Text("Rata-Rata IPK",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                Text("3.75",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white,
                        backgroundColor: Colors.red)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text("+20%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    )),
                Text("Perbandingan Tahun Lalu (%)",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                Text("+20%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white,
                        backgroundColor: Colors.red)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text("#1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    )),
                Text("Peringkat di Universitas",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                Text("#1",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white,
                        backgroundColor: Colors.red)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text("3.98",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    )),
                Text("Q1 IPK",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                Text("3.85",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white,
                        backgroundColor: Colors.red)),
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
