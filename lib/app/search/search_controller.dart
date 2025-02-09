import 'package:flutter/material.dart';
import 'package:terra_time_app/routes/app_routes.dart';

class SearchsController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  final List<String> popularSearches = [
    "New York, USA",
    "London, GB",
    "Islamabad, PK",
  ];
  void onSearch(BuildContext context) {
    if (searchController.text.isNotEmpty) {
      Navigator.pushNamed(context, AppRoutes.searchResult,
          arguments: searchController.text);
    }
  }

  String? selectedSearch;

  void setSearch(String searchTerm) {
    searchController.text = searchTerm;
    selectedSearch = searchTerm;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
