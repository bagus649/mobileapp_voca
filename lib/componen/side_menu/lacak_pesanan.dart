import 'package:flutter/material.dart';

class FormLacakPesanan extends StatefulWidget {
  @override
  _FormLacakPesananState createState() => _FormLacakPesananState();
}

class _FormLacakPesananState extends State<FormLacakPesanan> {
  String selectedCountry = '+62';
  String selectedFlag = 'assets/icons/indonesia.png';

  void updateSelectedFlag(String country) {
    switch (country) {
      case '+62':
        selectedFlag = 'assets/icons/indonesia.png';
        break;
      case '+60':
        selectedFlag = 'assets/icons/malaysia.png';
        break;
      case '+65':
        selectedFlag = 'assets/icons/singapore.png';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: <Widget>[
              PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    selectedCountry = value;

                    updateSelectedFlag(selectedCountry);
                  });
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: '+62',
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/indonesia.png',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          Text('+62'),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: '+60',
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/malaysia.png',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          Text('+60'),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: '+65',
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/singapore.png',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 8),
                          Text('+65'),
                        ],
                      ),
                    ),
                  ];
                },
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.black12,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        selectedFlag,
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 8),
                      Text(selectedCountry),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan nomor pesanan',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black26,
                ),
                onPressed: () {
                  print('Pencarian diklik');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
