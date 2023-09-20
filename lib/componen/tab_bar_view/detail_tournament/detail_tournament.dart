import 'package:flutter/material.dart';

import '../../../componen/lain_lain/componen_gambar_teks.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors

import 'isi_detail_tournament/hadiah_kulifikasi.dart';
import 'isi_detail_tournament/tournamament_stage.dart';

class TabDetailTournment extends StatelessWidget {
  // final Map<String, String> tournamentData;

  // TabDetailTournment({required this.tournamentData});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GambarTeks(
                imageAsset: 'assets/images/jadwal.png',
                title: 'Jadwal Pertandingan',
                description: '13 februari 2023 - 14 februari 2023',
                description2: 'Jam 8.00 - selesai',
              ),
              GambarTeks(
                imageAsset: 'assets/images/biayatiket.png',
                title: 'Biaya Pendaftaran',
                description: 'Rp 100.000,-',
              ),
              GambarTeks(
                imageAsset: 'assets/images/bracket.png',
                title: 'Sistem Eliminasi',
                description: 'Battle_royale',
              ),
              GambarTeks(
                imageAsset: 'assets/images/prize.png',
                title: 'Biaya Pendaftaran',
                description: 'Rp 120.000,-',
                // description: 'tournamentData['title4']!',
              ),
              GambarTeks(
                imageAsset: 'assets/images/contact.png',
                title: 'Contact Person',
                description: '081287222756',
              ),
              GambarTeks(
                imageAsset: 'assets/images/oraganisasi.png',
                title: 'VocaGame',
                description: 'Organizer',
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Tournament Stage',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              TrackOrderWidget(
                orderSteps: [
                  OrderStep(
                    description: '11 Feb - 12 feb 2023 • Registrasion',
                    iconImagePath: 'assets/icons/register.png',
                  ),
                  OrderStep(
                    description: '13 Feb 2023 • Upper Bracket',
                    iconImagePath: 'assets/icons/bracket_stage.png',
                  ),
                  OrderStep(
                    description: '14 Feb 2023 • Lower Bracket',
                    iconImagePath: 'assets/icons/bracket_stage.png',
                  ),
                  OrderStep(
                    description: '14 Feb 2023 • End',
                    iconImagePath: 'assets/icons/done.png',
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Peraturan Tournament',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Terbuka untuk Civitas Akademika Unair dan Pelajar. Tipe Turnamen: Offline (Kick off dan Final) dan Online',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Hadiah Kulifikasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              PrizeContainer(
                title: 'Juara 1',
                prizeDescription: 'Hadiah Rp. 7.500.000,- + Sertifikat',
              ),
              SizedBox(
                height: 12,
              ),
              PrizeContainer(
                title: 'Juara 2',
                prizeDescription: 'Hadiah Rp. 5.500.000,- + Sertifikat',
              ),
              SizedBox(
                height: 12,
              ),
              PrizeContainer(
                title: 'Juara 3',
                prizeDescription: 'Hadiah Rp. 3.500.000,- + Sertifikat',
              ),
              SizedBox(
                height: 12,
              ),
              PrizeContainer(
                title: 'Juara 4',
                prizeDescription: 'Hadiah Rp. 1.500.000,- + Sertifikat',
              ),
            ],
          ),
        ));
  }
}
