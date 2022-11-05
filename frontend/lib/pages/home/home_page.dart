import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sync_fit/utils/app_colors.dart';

final currIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  static const routename = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = ref.watch(currIndexProvider);
    return Scaffold(
      body: Column(
        children: const [
          Text('Friday, 4 Nov'),
          Text('Summary'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index) => ref.read(currIndexProvider.notifier).update(
              (state) => index,
            ),
        enableFeedback: true,
        type: BottomNavigationBarType.shifting,
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
