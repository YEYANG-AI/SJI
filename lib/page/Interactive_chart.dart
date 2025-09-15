import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class CandleData {
  final DateTime time;
  final double open, high, low, close;

  CandleData(this.time, this.open, this.high, this.low, this.close);
}

class InteractiveChart extends StatefulWidget {
  const InteractiveChart({super.key});

  @override
  _InteractiveChartState createState() => _InteractiveChartState();
}

class _InteractiveChartState extends State<InteractiveChart> {
  String selectedTimeframe = '1m';
  late Map<String, List<CandleData>> dataByTimeframe;

  @override
  void initState() {
    super.initState();
    // ตัวอย่างข้อมูลสมมติ (ควรโหลดจาก API จริง)
    dataByTimeframe = {
      '1m': _generateCandleData(60, Duration(minutes: 1)),
      '5m': _generateCandleData(60, Duration(minutes: 5)),
      '1h': _generateCandleData(24, Duration(hours: 1)),
      '1d': _generateCandleData(30, Duration(days: 1)),
    };
  }

  // ฟังก์ชันสร้างข้อมูลเทียนแบบสมจริง
  List<CandleData> _generateCandleData(int count, Duration interval) {
    final random = Random();
    final List<CandleData> data = [];

    // ราคาเริ่มต้น
    double previousClose = 100.0;

    for (int i = 0; i < count; i++) {
      final now = DateTime.now().subtract(interval * (count - i - 1));

      // สร้างการเปลี่ยนแปลงราคาแบบสุ่มแต่สมเหตุสมผล
      final changePercent = (random.nextDouble() - 0.5) * 0.02; // ±1% change
      final open = previousClose;
      final close = open * (1 + changePercent);

      // กำหนด high และ low ให้อยู่ในช่วงที่สมเหตุสมผล
      final maxPrice = max(open, close);
      final minPrice = min(open, close);

      // เพิ่มความแปรผันให้กับ high และ low
      final high =
          maxPrice * (1 + random.nextDouble() * 0.01); // สูงสุดเพิ่มได้ 1%
      final low = minPrice * (1 - random.nextDouble() * 0.01); // ต่ำสุดลดได้ 1%

      data.add(CandleData(now, open, high, low, close));
      previousClose = close;
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final data = dataByTimeframe[selectedTimeframe] ?? [];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['1m', '5m', '1h', '1d'].map((tf) {
            final isSelected = tf == selectedTimeframe;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.orange, width: 1.5),
                  ),
                  foregroundColor: isSelected ? Colors.white : Colors.orange,
                  backgroundColor: isSelected
                      ? Colors.orange.shade800
                      : Colors.grey.shade900,
                ),
                onPressed: () {
                  setState(() {
                    selectedTimeframe = tf;
                  });
                },
                child: Text(tf),
              ),
            );
          }).toList(),
        ),
        if (data.isEmpty)
          SizedBox(
            height: 200,
            child: Center(
              child: Text(
                'ไม่มีข้อมูลสำหรับช่วงเวลานี้',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        else
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                labelStyle: TextStyle(color: Colors.white),
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: Colors.grey.shade700,
                ),
              ),
              primaryYAxis: NumericAxis(
                labelStyle: TextStyle(color: Colors.white),
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: Colors.grey.shade700,
                ),
              ),
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enablePanning: true,
                zoomMode: ZoomMode.x,
              ),
              series: <CandleSeries<CandleData, DateTime>>[
                CandleSeries<CandleData, DateTime>(
                  dataSource: data,
                  xValueMapper: (CandleData d, _) => d.time,
                  lowValueMapper: (CandleData d, _) => d.low,
                  highValueMapper: (CandleData d, _) => d.high,
                  openValueMapper: (CandleData d, _) => d.open,
                  closeValueMapper: (CandleData d, _) => d.close,
                  bearColor: Colors.red,
                  bullColor: Colors.green,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
