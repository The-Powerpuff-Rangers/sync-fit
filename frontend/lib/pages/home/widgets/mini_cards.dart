import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniCard extends ConsumerWidget {
  final IconData icon;
  final String title;
  final String time;
  final String content;
  final VoidCallback onTap;
  final Color color;
  final Color? secondaryColor;
  const MiniCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.time,
      required this.content,
      required this.onTap,
      this.secondaryColor,
      required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      FaIcon(
                        icon,
                        size: 20,
                        color: secondaryColor,
                      ),
                      const SizedBox(width: 8),
                      AutoSizeText(
                        title,
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'SF-Pro Display',
                            fontWeight: FontWeight.w400,
                            color: secondaryColor),
                      ),
                    ],
                  ),
                ),
                AutoSizeText(time)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            AutoSizeText(
              content,
              style: const TextStyle(
                fontFamily: 'SF-Pro Display',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
