import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/app_colors.dart';

class SplashScreen extends ConsumerWidget {
  static const routename = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    // Check for permissions in the splash screen

    return Scaffold(
      body: Center(
        child: AutoSizeText.rich(
          TextSpan(
            text: 'Sync',
            style: textTheme.headline4,
            children: [
              TextSpan(text: ' Fit', style: TextStyle(color: AppColors.syncGreen)),
            ],
          ),
        ),
      ),
    );
  }
}
