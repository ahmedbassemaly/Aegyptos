import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../user_data.dart';

final userDataProviderRepository =
    StateProvider.autoDispose<Stream>((ref) => UserData().getUserDetails());
final userDataProvider =
    StreamProvider.autoDispose((ref) => ref.watch(userDataProviderRepository));

