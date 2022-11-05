import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sync_fit/pages/account/account_page.dart';
import 'package:sync_fit/pages/home/widgets/mini_cards.dart';
import 'package:sync_fit/pages/settings/settings_screen.dart';
import 'package:sync_fit/utils/app_colors.dart';

final currIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  static const routename = '/home';
  HomePage({super.key});

  final List<Widget> _pages = [
    const HomeScreen(),
    const SettingsScreen(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = ref.watch(currIndexProvider);
    return Scaffold(
      body: _pages[currIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color.fromARGB(255, 66, 66, 66), width: 1.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: currIndex,
          onTap: (index) => ref.read(currIndexProvider.notifier).update(
                (state) => index,
              ),
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          showSelectedLabels: false,
          fixedColor: AppColors.syncGreen,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house), label: ''),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.gear), label: ''),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.user), label: ''),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              'Friday, 4 Nov',
              style: TextStyle(
                fontFamily: 'SF-Pro Display',
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const AutoSizeText(
              'Summary',
              style: TextStyle(
                fontFamily: 'SF-Pro Display',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const AutoSizeText(
              'Activity',
              style: TextStyle(
                fontFamily: 'SF-Pro Display',
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            MiniCard(
                icon: FontAwesomeIcons.bed,
                title: 'Sleep',
                time: '12:03 am',
                content: '7h 57mins',
                color: AppColors.parrotGreen,
                secondaryColor: AppColors.paleGreen,
                onTap: () {}),
            MiniCard(
                icon: FontAwesomeIcons.water,
                title: 'SpO2',
                time: '12:03 am',
                content: '98%',
                color: AppColors.oceanBlue,
                secondaryColor: AppColors.paleBlue,
                onTap: () {}),
            MiniCard(
                icon: FontAwesomeIcons.solidHeart,
                title: 'Heart Rate',
                time: '12:03 am',
                content: '80 bpm',
                color: AppColors.heartRed.withOpacity(0.4),
                secondaryColor: Colors.red.shade900,
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
