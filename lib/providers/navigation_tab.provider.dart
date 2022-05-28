import 'package:flutter/material.dart';

class NavigationTabProvider extends ChangeNotifier {
  int _tabSelected = 0;
  final PageController _tabController = PageController();

  int get tabSelected => _tabSelected;
  set tabSelected(int value) {
    _tabSelected = value;
    _tabController.animateToPage(
      value,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
    notifyListeners();
  }

  get tabController => _tabController;
}
