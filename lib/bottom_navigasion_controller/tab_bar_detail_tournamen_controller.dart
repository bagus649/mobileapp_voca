import 'package:flutter/material.dart';
import 'package:mobile/componen/tab_bar_view/detail_tournament/bracket.dart';
import 'package:mobile/componen/tab_bar_view/detail_tournament/detail_tournament.dart';
import 'package:mobile/componen/tab_bar_view/detail_tournament/pengumuman.dart';
import 'package:mobile/componen/tab_bar_view/detail_tournament/peserta.dart';

class TabBarDetailTournamen1 extends StatelessWidget {
  final int selectedTab;

  TabBarDetailTournamen1({required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      initialIndex: selectedTab,
      length: 4,
      child: Container(
        constraints: BoxConstraints(maxHeight: screenHeight),
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    'Detail Tournament',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Peserta',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Pengumuman',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Bracket',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              indicatorColor: Color(0xff6EFF7D),
              labelColor: Colors.white,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TabDetailTournment(),
                  TabPeserta(),
                  TabPengumuman(),
                  TabBracket(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
