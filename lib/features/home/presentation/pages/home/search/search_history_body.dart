import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/data_sources/local/search_history_service.dart';

class SearchHistoryBody extends StatefulWidget {
  const SearchHistoryBody({super.key});

  @override
  State<SearchHistoryBody> createState() => _SearchHistoryBodyState();
}

class _SearchHistoryBodyState extends State<SearchHistoryBody> {
  final SearchHistoryService _service = SearchHistoryService();
  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  void _loadHistory() {
    setState(() {
      _history = _service.getHistory();
    });
  }

  void _deleteItem(String query) {
    _service.deleteItem(query);
    _loadHistory();
  }

  void _clearAll() {
    _service.clearHistory();
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 14),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent",
                style:TextStyle(
                  fontSize: 20,
                  color: Colors.grey[900],
                ),
              ),
              TextButton(
                onPressed: _clearAll,
                child: Text(
                  "Clear All",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[900],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:10.h),
          Divider(thickness: 1, color: Colors.grey[200]),
          Expanded(
            child:
                _history.isEmpty
                    ? Center(
                      child: Text(
                        "No search history",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[900],
                        ),
                      ),
                    )
                    : ListView.builder(
                      itemCount: _history.length,
                      itemBuilder:
                          (context, index) => _searchedHistory(_history[index]),
                    ),
          ),
        ],
      ),
    );
  }

  Widget _searchedHistory(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:TextStyle(
            fontSize: 18,
            color: Colors.grey[900],
          ),
        ),
        IconButton(
          onPressed: () => _deleteItem(title),
          icon: Icon(IconlyLight.close_square),
        ),
      ],
    );
  }
}
