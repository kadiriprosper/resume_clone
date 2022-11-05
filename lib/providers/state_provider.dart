import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProvider = Provider(
  (ref) => StateProvider(),
);

class StateProvider extends ChangeNotifier {
  bool showAboutMe = false;
  bool showWhatIBring = false;

  set setShowAboutMe(bool showState) {
    showAboutMe = showState;
    notifyListeners();
  }

  set setShowIBring(bool showState) {
    showWhatIBring = showState;
    notifyListeners();
  }
}
