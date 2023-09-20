import 'package:flutter/material.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import 'isi_peserta/team_list.dart';

class TabPeserta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TeamContainer(
            teamName: 'Awesome Team',
            teamImage: 'assets/icons/logovoca.png',
            members: [
              Member(name: 'John', status: 'Captain'),
              Member(name: 'doni', status: 'Member'),
              Member(name: 'Bob', status: 'Member'),
              Member(name: 'dodo', status: 'Member'),
              Member(name: 'dodi', status: 'Member'),
            ],
          ),
          TeamContainer(
            teamName: 'Voca Team',
            teamImage: 'assets/icons/logovoca.png',
            members: [
              Member(name: 'Joni', status: 'Captain'),
              Member(name: 'dono', status: 'Member'),
              Member(name: 'Bobo', status: 'Member'),
              Member(name: 'dod', status: 'Member'),
              Member(name: 'dop', status: 'Member'),
            ],
          ),
          TeamContainer(
            teamName: 'Voca Team',
            teamImage: 'assets/icons/logovoca.png',
            members: [
              Member(name: 'Joni', status: 'Captain'),
              Member(name: 'dono', status: 'Member'),
              Member(name: 'Bobo', status: 'Member'),
              Member(name: 'dod', status: 'Member'),
              Member(name: 'dop', status: 'Member'),
            ],
          ),
          TeamContainer(
            teamName: 'Voca Team',
            teamImage: 'assets/icons/logovoca.png',
            members: [
              Member(name: 'Joni', status: 'Captain'),
              Member(name: 'dono', status: 'Member'),
              Member(name: 'Bobo', status: 'Member'),
              Member(name: 'dod', status: 'Member'),
              Member(name: 'dop', status: 'Member'),
            ],
          ),
          TeamContainer(
            teamName: 'Voca Team',
            teamImage: 'assets/icons/logovoca.png',
            members: [
              Member(name: 'Joni', status: 'Captain'),
              Member(name: 'dono', status: 'Member'),
              Member(name: 'Bobo', status: 'Member'),
              Member(name: 'dod', status: 'Member'),
              Member(name: 'dop', status: 'Member'),
            ],
          ),
        ],
      ),
    ));
  }
}
