import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late List<CandleData> _chartData;
  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCartesianChart(
            backgroundColor: Colors.black,
            primaryXAxis: DateTimeAxis(
              isVisible: false,
              majorGridLines: const MajorGridLines(
                width: 1,
                color: Colors.grey,
              ),
            ),
            primaryYAxis: NumericAxis(
              labelStyle: const TextStyle(color: Colors.white),
              isVisible: true,
              majorGridLines: MajorGridLines(
                width: 1,
                color: Colors.grey.shade800,
              ),
            ),
            series: <CandleSeries<CandleData, DateTime>>[
              CandleSeries<CandleData, DateTime>(
                dataSource: _chartData,
                xValueMapper: (CandleData data, _) => data.date,
                lowValueMapper: (CandleData data, _) => data.low,
                highValueMapper: (CandleData data, _) => data.high,
                openValueMapper: (CandleData data, _) => data.open,
                closeValueMapper: (CandleData data, _) => data.close,
                bullColor: Colors.green,
                bearColor: Colors.red,
              ),
            ],
            zoomPanBehavior: ZoomPanBehavior(
              enablePinching: true,
              enablePanning: true,
              enableDoubleTapZooming: true,
              zoomMode: ZoomMode.x,
            ),
          ),
        ),
      ],
    );
  }

  List<CandleData> getChartData() {
    return [
      CandleData(DateTime(2025, 8, 13), 245, 248, 240, 242),
      CandleData(DateTime(2025, 8, 14), 242, 247, 238, 239),
      CandleData(DateTime(2025, 8, 15), 239, 246, 236, 244),
      CandleData(DateTime(2025, 8, 1), 230, 240, 225, 238),
      CandleData(DateTime(2025, 8, 2), 238, 245, 235, 240),
      CandleData(DateTime(2025, 8, 3), 240, 250, 239, 245),
      CandleData(DateTime(2025, 8, 4), 245, 248, 240, 242),
      CandleData(DateTime(2025, 8, 5), 242, 247, 238, 239),
      CandleData(DateTime(2025, 8, 6), 239, 246, 236, 244),
      CandleData(DateTime(2025, 8, 7), 244, 252, 242, 250),
      CandleData(DateTime(2025, 8, 8), 250, 255, 248, 253),
      CandleData(DateTime(2025, 8, 9), 253, 257, 249, 251),
      CandleData(DateTime(2025, 8, 10), 251, 256, 247, 248),
      CandleData(DateTime(2025, 8, 11), 248, 252, 245, 246),
      CandleData(DateTime(2025, 8, 12), 246, 249, 243, 247),
    ];
  }
}

class CandleData {
  CandleData(this.date, this.open, this.high, this.low, this.close);

  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;
}
