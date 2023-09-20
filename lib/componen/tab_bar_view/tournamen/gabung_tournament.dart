import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'package:mobile/componen/tab_bar_view/tournamen/custom_text_field2.dart';

import '../../../appbar_navbar/custom_appbar_navigasi.dart';
import '../detail_tournament/isi_detail_tournament/card_tournamen.dart';

class TournamentRegistrationPage extends StatefulWidget {
  final Map<String, String> tournamentData;

  TournamentRegistrationPage({required this.tournamentData});

  @override
  _TournamentRegistrationPageState createState() =>
      _TournamentRegistrationPageState();
}

class _TournamentRegistrationPageState
    extends State<TournamentRegistrationPage> {
  String teamName = '';
  String teamLogo = '';
  String phoneNumber = '';

  TextEditingController teamNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  List<TextEditingController> memberNameControllers =
      List.generate(6, (_) => TextEditingController());
  bool isImageUploaded = false;
  String? selectedFileName;
  bool isButtonPressed = false;

  bool showHelperText = false;

  void _showConfirmationDialog() {
    if (teamName.isEmpty && phoneNumber.isEmpty) {
      setState(() {
        showHelperText = true;
      });
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text('Konfirmasi Data'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Team: $teamName',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                if (isImageUploaded)
                  Row(
                    children: [
                      Text(
                        'Logo Team: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          File(teamLogo),
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                Text('No Whatsapp: $phoneNumber',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text('Roster/Pemain:',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                for (int i = 0; i < 5; i++)
                  Text('NICKNAME${i + 1}: ${memberNameControllers[i].text}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Konfirmasi'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _uploadImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final fileName = file.path.split('/').last;
      setState(() {
        teamLogo = pickedFile.path;
        isImageUploaded = true;
        selectedFileName = fileName;
      });
    }
  }

  void _deleteImage() {
    setState(() {
      teamLogo = '';
      isImageUploaded = false;
      selectedFileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: 'Daftar Tournament'),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            isButtonPressed = true;
          });
          _showConfirmationDialog();
        },
        child: Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff17C82A),
          ),
          height: 52,
          child: Center(
            child: Text(
              'Konfirmasi Tournament',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TournamentCard(tournamentData: widget.tournamentData),
            SizedBox(height: 16),
            CustomTextField2(
              title: 'Nama Team',
              hintText: 'Masukan Nama',
              controller: teamNameController,
              onChanged: (value) {
                setState(() {
                  teamName = value;
                  showHelperText = false;
                });
              },
              isRedBorder: isButtonPressed && phoneNumber.isEmpty,
            ),
            SizedBox(height: 16),
            Text(
              'Logo team (Optional)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: _uploadImage,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff012276).withOpacity(0.09),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Pilih File',
                          style: TextStyle(color: Color(0xff6B7B78)),
                        ),
                      )),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        selectedFileName ?? 'Tidak ada file dipilih',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: isImageUploaded
                        ? Image.file(
                            File(teamLogo),
                            width: 40,
                            height: 40,
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            if (isImageUploaded)
              Container(
                child: Row(
                  children: [
                    if (isImageUploaded)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Action',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: _deleteImage,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffC81717).withOpacity(0.24),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/delete.png',
                                  ),
                                )),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            SizedBox(height: 16),
            CustomTextField2(
              title: 'No Whatsapp',
              hintText: '081238123797',
              controller: phoneNumberController,
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                  showHelperText = false;
                });
              },
              isRedBorder: isButtonPressed && phoneNumber.isEmpty,
            ),
            SizedBox(height: 16),
            Text(
              'Info Roster/Pemain',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Isi data di bawah untuk pendataan roaster/pemain yang akan bertanding',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, i) {
                var isRedBorder =
                    isButtonPressed && memberNameControllers[i].text.isEmpty;

                return Container(
                  margin: EdgeInsets.only(top: 12),
                  child: CustomTextField2(
                    titleFontSize: 12,
                    titleFontWeight: FontWeight.w400,
                    title: 'NICKNAME${i + 1}',
                    hintText: 'VOCA${i + 1}',
                    controller: memberNameControllers[i],
                    onChanged: (value) {
                      setState(() {
                        isRedBorder = isButtonPressed && value.isEmpty;
                      });
                    },
                    isRedBorder: isRedBorder,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
