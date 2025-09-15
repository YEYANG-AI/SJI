import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StockChart extends StatelessWidget {
  const StockChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  String text;
                  Color color = Colors.grey;

                  switch (value.toInt()) {
                    case 0:
                      text = '1W';
                      break;
                    case 1:
                      text = 'MTD';
                      break;
                    case 2:
                      text = '1M';
                      break;
                    case 3:
                      text = '3M';
                      break;
                    case 4:
                      text = 'YTD';
                      break;
                    case 5:
                      text = '1Y';
                      color = Colors.white;
                      break;
                    case 6:
                      text = 'All';
                      break;
                    default:
                      text = '';
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 8), // space from chart
                    child: Text(
                      text,
                      style: TextStyle(color: color, fontSize: 12),
                    ),
                  );
                },
              ),
            ),

            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ), // hide left side
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  Widget label;

                  if (value == 0) {
                    label = const Text(
                      '0.00',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    );
                  } else if (value == 2000) {
                    label = const Text(
                      '2K',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    );
                  } else if (value == 4000) {
                    label = const Text(
                      '4K',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    );
                  } else if (value == -2000) {
                    label = const Text(
                      '-2K',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    );
                  } else {
                    label = const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ), // optional spacing from chart
                    child: label,
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minY: -2000, // match lowest value in your axis
          maxY: 4000, // match highest value in your axis
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 0),
                FlSpot(1, 500),
                FlSpot(2, 1000),
                FlSpot(3, 2000),
                FlSpot(4, 3000),
                FlSpot(5, 4000),
              ],
              isCurved: true,
              gradient: LinearGradient(
                colors: [Colors.cyanAccent, Colors.tealAccent],
              ),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(
                      255,
                      10,
                      10,
                      210,
                    ).withOpacity(0.3), // blue
                    const Color.fromARGB(
                      255,
                      215,
                      11,
                      11,
                    ).withOpacity(0.3), // red
                  ],
                  stops: [0.5, 1.0], // blue ends at 80%, red takes last 20%
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
