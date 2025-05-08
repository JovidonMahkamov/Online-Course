
import 'package:get_storage/get_storage.dart';

class SearchHistoryService {
  final box = GetStorage();
  final String _key = 'search_history';

  List<String> getHistory() {
    return List<String>.from(box.read(_key) ?? []);
  }

  void addQuery(String query) {
    final history = getHistory();
    if (!history.contains(query)) {
      history.add(query);
      box.write(_key, history);
    }
  }

  void clearHistory() {
    box.remove(_key);
  }

  void deleteItem(String query) {
    final history = getHistory();
    history.remove(query);
    box.write(_key, history);
  }
}
