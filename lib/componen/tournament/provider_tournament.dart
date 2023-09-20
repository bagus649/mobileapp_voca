import 'package:flutter/material.dart';

class TournamentDataProvider with ChangeNotifier {
  Map<String, String> _tournamentData = {};

  Map<String, String> get tournamentData => _tournamentData;

  void setData(Map<String, String> data) {
    _tournamentData = data;
    notifyListeners();
  }
}
