import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sync_fit/utils/app_colors.dart';

class ActivityCard extends ConsumerWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.yellow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              miniTile('Goal (cal)', '2000'),
              miniTile('Steps', '4,739'),
              miniTile('Distance (km)', '3.42'),
            ],
          ),
          Container(
            width: 200,
            height: 140,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PieChart(
              dataMap: const {
                'hemlo': 10,
                'to': 7,
              },
              
              chartType: ChartType.ring,
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: false,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
              ),
              legendOptions: const LegendOptions(
                showLegends: false,
                showLegendsInRow: false,
              ),
              colorList: [
                const Color(0xff3F1B25),
                AppColors.parrotGreen,
              ],
            ),
          )
        ],
      ),
    );
  }

  Column miniTile(String firstText, String second) {
    return Column(
      children: const [
        AutoSizeText(
          'Goal (cal)',
          style: TextStyle(
              fontSize: 17,
              fontFamily: 'SF-Pro Display',
              fontWeight: FontWeight.w400,
              color: Color(0xffBD8800)),
        ),
        AutoSizeText('161/430',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'SF-Pro Display',
                fontWeight: FontWeight.w900,
                color: Colors.black)),
      ],
    );
  }
}
