import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:portfolio1/features/home/presentation/pages/home/search/search_history_body.dart';
import 'package:portfolio1/features/home/presentation/pages/home/search/search_result_body.dart';

import '../../../../data/data_sources/local/search_history_service.dart';
import '../../../bloc/home_event.dart';
import '../../../bloc/search/search_bloc.dart';
import '../../../bloc/search/search_state.dart';
import '../../../widgets/custom_choise_chip_wg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;
  String _query = "";
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  int selectedIndex = 0;

  final List<String> options = [
    '🔥 All',
    '💡 3D Design',
    '💰 Business',
    '🎨 Design',
  ];

  int selectedRatingIndex = 0;

  final List<String> optionsRating = ['All', '5', '4', '3', '2', '1'];
  final _searchHistoryService = SearchHistoryService();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String query) {
    setState(() {
      _query = query;
      _isFocused = false;
    });
    _searchHistoryService.addQuery(query);
    context.read<SearchBloc>().add(SearchEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey[50],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left, size: 25),
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.bottom_Navbar);
          },
        ),
        title: Container(
          height: 53,
          decoration: BoxDecoration(
            color: _isFocused ? const Color(0xffEFF3FF) : Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isFocused ? Colors.blue : Colors.grey,
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(
                IconlyLight.search,
                size: 20,
                color: Colors.grey[400],
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  onTap: () {
                    setState(() {
                      _isFocused = true;
                    });
                  },
                  onSubmitted: (value) {
                    _onSearchSubmitted(value);
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  _modalBottomSheetFilter();
                },
                icon: Icon(
                  IconlyLight.filter,
                  size: 20,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _query.isEmpty
          ? const SearchHistoryBody()
          : BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return Center(
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,
                      colors: [Colors.white],
                      strokeWidth: 2,
                    ),
                  );
                } else if (state is SearchLoaded) {
                  return SearchResultBody(
                    searchResponse: state.searchResponse!,
                    query: _query,
                  );
                } else if (state is SearchError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
    );
  }

  void _modalBottomSheetFilter() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: 581,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: (15)),
                    Center(
                      child: Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    SizedBox(height: (15)),
                    Divider(thickness: 1, color: Colors.grey[200]),
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: (15)),
                    // ! Category check bar
                    SizedBox(
                      height: (40),
                      child: ListView.builder(
                        itemCount: options.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CustomChoiceChipWg(
                          index: index,
                          label: options[index],
                          selectedIndex: selectedIndex,
                          onSelected: (selected) {
                            setModalState(() {
                              selectedIndex = selected ? index : selectedIndex;
                            });
                          },
                        ),
                      ),
                    ),
                    // ! Category check bar
                    SizedBox(height: (15)),
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[900],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                        valueIndicatorColor: Colors.blue,
                        valueIndicatorTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: RangeSlider(
                        values: _currentRangeValues,
                        max: 100,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[200],
                        labels: RangeLabels(
                          '\$${_currentRangeValues.start.round()}',
                          '\$${_currentRangeValues.end.round()}',
                        ),
                        onChanged: (RangeValues values) {
                          setModalState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),

                    // SizedBox(height: appH(10)),
                    Text(
                      'Rating',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: (15)),
                    //! Rating check bar
                    SizedBox(
                      height: (40),
                      child: ListView.builder(
                        itemCount: optionsRating.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CustomChoiceChipWg(
                          showIcon: true,
                          index: index,
                          label: optionsRating[index],
                          selectedIndex: selectedRatingIndex,
                          onSelected: (selected) {
                            setModalState(() {
                              selectedRatingIndex =
                                  selected ? index : selectedRatingIndex;
                            });
                          },
                        ),
                      ),
                    ),
                    //! Rating check bar
                    SizedBox(height: (10)),
                    Divider(thickness: 1, color: Colors.grey[200]),
                    SizedBox(height: (10)),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setModalState(() {
                                selectedIndex = 0;
                                selectedRatingIndex = 0;
                                _currentRangeValues = RangeValues(1, 100);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                horizontal: (30),
                              ),
                              minimumSize: const Size(0, 58),
                            ),
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: (10)),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                horizontal: (30),
                              ),
                              minimumSize: const Size(0, 58),
                            ),
                            child: Text(
                              "Filter",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
