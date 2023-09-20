import 'package:flutter/material.dart';
// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import 'isi_peserta/team_list.dart';

class TabPengumuman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TeamContainer(
                teamName:
                    'Pengumuman Diskualifikasi team yang cheat pekalongan',
                // teamImage: 'assets/icons/logovoca.png',
                members: [
                  Member(
                      name:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      status: ''),
                ],
              ),
              TeamContainer(
                teamName:
                    'Pengumuman Diskualifikasi team yang cheat pekalongan',
                // teamImage: 'assets/icons/logovoca.png',
                members: [
                  Member(
                      name:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      status: ''),
                ],
              ),
              TeamContainer(
                teamName: 'Penundaan Lomba yang diadakan di kampus 0 univ..',
                // teamImage: 'assets/icons/logovoca.png',
                members: [
                  Member(
                      name:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      status: ''),
                ],
              ),
              TeamContainer(
                teamName: 'Penundaan Lomba yang diadakan di kampus 0 univ..',
                // teamImage: 'assets/icons/logovoca.png',
                members: [
                  Member(
                      name:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      status: ''),
                ],
              ),
              TeamContainer(
                teamName: 'Penundaan Lomba yang diadakan di kampus 0 univ..',
                // teamImage: 'assets/icons/logovoca.png',
                members: [
                  Member(
                      name:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      status: ''),
                ],
              ),
            ],
          ),
        ));
  }
}
