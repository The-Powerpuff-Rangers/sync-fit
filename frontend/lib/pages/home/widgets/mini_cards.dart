import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniCard extends ConsumerWidget {
  final IconData icon;
  final String title;
  final String time;
  final String secondTime;
  final VoidCallback onTap;
  const MiniCard({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.secondTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      FaIcon(icon),
                      Text(title),
                    ],
                  ),
                ),
                Text(time)
              ],
            ),
            Text(secondTime)
          ],
        ),
      ),
    );
  }
}
