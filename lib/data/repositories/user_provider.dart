import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../user_data.dart';

Stream userData = UserData().getUserDetails();
final userDataProviderRepository = StateProvider<Stream>((ref) => userData);

final userDataProvider =
    StreamProvider(((ref) => ref.watch(userDataProviderRepository)));
