import '../history_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Stream historyData = History().getUserHistory();
final historyDataProviderRepository =
    StateProvider.autoDispose<Stream>((ref) => History().getUserHistory());

final historyDataProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(historyDataProviderRepository));
