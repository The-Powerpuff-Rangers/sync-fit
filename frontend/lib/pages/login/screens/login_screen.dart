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
      body: SafeArea(child: LayoutBuilder(builder: (context, size) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                  width: size.maxWidth,
                  child: Image.asset('assets/images/login_top.png'),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 18),
                  child: AutoSizeText(
                    'Welcome to ',
                    style: textTheme.headline3!.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: SizedBox(
                      width: size.maxWidth * 0.6,
                      child: Image.asset(
                        'assets/images/full_logo.png',
                        color: Colors.white,
                      )),
                ),
                const Spacer(),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.maxWidth * 0.6,
                      height: size.maxHeight / 11,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                            strokeAlign: StrokeAlign.inside,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(36)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/icons/fitbit.png'),
                          AutoSizeText(
                            'Signin with Fitbit',
                            style: textTheme.subtitle2!.copyWith(
                                fontFamily: 'SF-Pro Display', fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
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
        );
      })),
    );
  }
}
