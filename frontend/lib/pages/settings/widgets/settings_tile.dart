import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_fit/main.dart';
import 'package:sync_fit/providers/providers.dart';

class SettingsTile extends ConsumerWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const SettingsTile({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD4D4D4), width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 10),
                  AutoSizeText(
                    title,
                    style: const TextStyle(
                      fontFamily: 'SF-Pro Display',
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff818181),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: InkWell(
        onTap: () async {
          final route = GoRouter.of(context);
          await ref.read(authApiProvider).logout();
          ref.refresh(futureTokensProvider);
          route.go(AuthChecker.routename);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD4D4D4), width: 1.5),
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffFF001E).withOpacity(0.7),
          ),
          child: const Center(
            child: AutoSizeText(
              'Logout',
              style: TextStyle(
                fontFamily: 'SF-Pro Display',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
