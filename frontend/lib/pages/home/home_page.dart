import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  static const routename = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: const [
          Text('Friday, 4 Nov'),
          Text('Summary'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [],
        currentIndex: 0,
        onTap: (index) => ref.read(currIndexProvider.notifier).update(
              (state) => index,
            ),
      ),
    );
  }
}
