import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sync_fit/api/authentication.dart';

final authProvider = Provider<Authentication>((ref) {
  return Authentication();
});
