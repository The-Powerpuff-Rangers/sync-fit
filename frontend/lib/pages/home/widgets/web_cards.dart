import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _assetLists = [
  "assets/images/vec1.jpg",
  "assets/images/vec2.jpg",
  "assets/images/vec3.jpg",
  "assets/images/vec4.jpg",
  "assets/images/vec5.jpg",
];

class WebCards extends ConsumerWidget {
  final VoidCallback onTap;
  final String title;
  const WebCards({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(16),
          color: Colors.black,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                _assetLists[Random().nextInt(_assetLists.length)],
                fit: BoxFit.cover,
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 20, top: 8),
                  child: AutoSizeText(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
