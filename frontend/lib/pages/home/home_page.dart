import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sync_fit/pages/account/account_page.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index) => ref.read(currIndexProvider.notifier).update(
              (state) => index,
            ),
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        iconSize: 22,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text('Friday, 4 Nov'),
          Text('Summary'),
        ],
      ),
    );
  }
}
