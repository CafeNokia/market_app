import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:market_app/http/dio/index.dart';
// import 'package:market_app/data/models/trade/index.dart';

class CStandardChart extends StatefulWidget {
  const CStandardChart({super.key});

  @override
  State<CStandardChart> createState() => _CStandardChartState();
}

class _CStandardChartState extends State<CStandardChart> {
  bool _isLoading = true;

  List<double> barValues = [];
  List<double> lineValues = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response = await CDioClient().dio.post(
        '/trade/code',
        data: {
          'size': 1,
          'keyword': '603800'
        }
      );
      // print(response);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> dataList = response.data['datas'];
        // print(dataList);
        setState(() {
          // List<CTradeModel> _tableData = dataList.map((json) => CTradeModel.fromJson(json)).toList();
          lineValues = dataList.map((item) => item['new_price'] as double).toList();
          barValues = dataList.map((item) => item['turnover_rate'] as double).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('request failed: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dual Axis Chart"), backgroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // 📊 Bar Chart
            BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: barValues.asMap().entries.map((entry) {
                  int index = entry.key;
                  double value = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        gradient: const LinearGradient(
                          colors: [Color.fromARGB(255, 114, 35, 15), Color.fromARGB(255, 132, 17, 4)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ],
                  );
                }).toList(),
                // titlesData: FlTitlesData(
                //   leftTitles: AxisTitles(
                //     sideTitles: SideTitles(showTitles: true),
                //   ),
                //   rightTitles: AxisTitles(
                //     sideTitles: SideTitles(showTitles: true),
                //   ),
                //   bottomTitles: AxisTitles(
                //     sideTitles: SideTitles(showTitles: true),
                //   ),
                //   topTitles: AxisTitles(
                //     sideTitles: SideTitles(showTitles: false),
                //   ),
                // ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50, // 👈 set width of Y-axis label area
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toString(),
                          style: const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40, // 👈 set width for right Y-axis
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: false),
              ),
            ),

            // 📈 Line Chart overlay
            LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: lineValues.asMap().entries.map((entry) {
                      int index = entry.key;
                      double value = entry.value;
                      return FlSpot(index.toDouble(), value);
                    }).toList(),
                    isCurved: true,
                    barWidth: 3,
                    gradient: const LinearGradient(
                      colors: [Colors.red, Colors.orange],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    dotData: FlDotData(show: true),
                  ),
                ],
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
