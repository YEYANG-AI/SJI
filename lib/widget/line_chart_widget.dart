import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: -0.5,
        maxY: 0.5,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Text(
                      'Today',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    );
                  case 1:
                    return Text(
                      '5D',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    );
                  case 2:
                    return Text(
                      '1M',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    );
                  case 3:
                    return Text(
                      '1Y',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    );
                  case 4:
                    return Text(
                      '2Y',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    );
                  default:
                    return Text('');
                }
              },
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            axisNameSize: 20,
            sideTitles: SideTitles(
              showTitles: false,
              interval: 0.1,
              getTitlesWidget: (value, meta) => Text(
                value.toStringAsFixed(1),
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 0.3,
              getTitlesWidget: (value, meta) => Text(
                '${(value * 100).toStringAsFixed(0)}%',
                style: TextStyle(fontSize: 7, color: Colors.white),
              ),
            ),
          ),
        ),
        lineBarsData: [
          _buildLineData(Colors.purple, [0.4, 0.2, 0.0, -0.2, -0.5]),
          _buildLineData(Colors.orange, [0.3, 0.1, -0.1, -0.3, -0.5]),
          _buildLineData(Colors.blue, [0.2, 0.0, -0.2, -0.4, -0.5]),
        ],
      ),
    );
  }

  LineChartBarData _buildLineData(Color color, List<double> values) {
    return LineChartBarData(
      spots: List.generate(
        values.length,
        (i) => FlSpot(i.toDouble(), values[i]),
      ),
      isCurved: true,
      color: color,
      barWidth: 2,

      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      aboveBarData: BarAreaData(show: false),
    );
  }
}
