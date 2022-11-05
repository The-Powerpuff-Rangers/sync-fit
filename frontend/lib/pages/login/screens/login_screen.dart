import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          LayoutBuilder(builder: (context, size) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 18),
                  child: AutoSizeText('Welcome to ', style: textTheme.headline3),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: SizedBox(
                    width: size.maxWidth * 0.6,
                    child: Image.asset(
                      'assets/images/full_logo.png',
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                            strokeAlign: StrokeAlign.inside,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset('assets/icons/fitbit.png'),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: AutoSizeText(
                      'Continue with Fitbit',
                      style: textTheme.subtitle2!.copyWith(fontFamily: 'SF-Pro Display'),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
              ],
            );
          }),
          Positioned(
              bottom: -22,
              left: -20,
              child: SizedBox(
                height: 270,
                width: 250,
                child: Lottie.asset(
                  'assets/lottie/fitness.json',
                  repeat: true,
                  // addRepaintBoundary: true,
                  fit: BoxFit.cover,
                ),
              )),
        ],
      )),
    );
  }
}
