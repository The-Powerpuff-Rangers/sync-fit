import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sync_fit/models/activity.dart';
import 'package:sync_fit/utils/app_colors.dart';

class ActivityCard extends ConsumerWidget {
  final Activity activity;
  const ActivityCard({super.key, required this.activity});

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              miniTile('Goal (cal)', '${activity.calories}'),
              miniTile('Steps', '${activity.step}'),
              miniTile('Distance (miles)', '${activity.distance}'),
            ],
          ),
          Flexible(
            child: Container(
              width: 200,
              height: 140,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PieChart(
                dataMap: {
                  'StepGoal': activity.stepGoal.toDouble(),
                  'step': activity.step.toDouble(),
                },
                initialAngleInDegree: 10 * pi,
                ringStrokeWidth: 32,
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
            ),
          )
        ],
      ),
    );
  }

  Column miniTile(String firstText, String second) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          firstText,
          style: const TextStyle(
              fontSize: 17,
              fontFamily: 'SF-Pro Display',
              fontWeight: FontWeight.w400,
              color: Color(0xffBD8800)),
        ),
        AutoSizeText(second,
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'SF-Pro Display',
                fontWeight: FontWeight.w900,
                color: Colors.black)),
      ],
    );
  }
}
