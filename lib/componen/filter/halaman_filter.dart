import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:mobile/halaman/halaman_bukti_pembayaraan.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors
// ignore: avoid_unnecessary_containers

void filterCustomBottomSheet(BuildContext context) {
  showFlexibleBottomSheet(
    context: context,
    minHeight: 200,
    initHeight: 200,
    maxHeight: 800,
    builder: (BuildContext context, ScrollController scrollController,
        double height) {
      double contentHeight = height;
      if (contentHeight < 200) {
        contentHeight = 200;
      } else if (contentHeight > 800) {
        contentHeight = 800;
      }

      return Container(
        padding: EdgeInsets.all(16),
        height: contentHeight,
        child: BottomSheetFilter(),
      );
    },
  );
}

class BottomSheetFilter extends StatefulWidget {
  @override
  _BottomSheetFilterState createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  int selectedStatusIndex = 0;
  int selectedTimeRangeIndex = 0;
  bool showDateRangePicker = false;
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  final int defaultStatusIndex = 0;
  final int defaultTimeRangeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: showDateRangePicker ? 460 : 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 8,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Filter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                'Status',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          buildStatusFilter(0, 'Semua'),
          SizedBox(height: 4),
          buildStatusFilter(1, 'Selesai'),
          SizedBox(height: 4),
          buildStatusFilter(2, 'Batal'),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Rentang Waktu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          buildTimeRangeFilter(0, 'Minggu Ini'),
          SizedBox(height: 4),
          buildTimeRangeFilter(1, 'Bulan Ini'),
          SizedBox(height: 4),
          buildTimeRangeFilter(2, 'Pilih Tanggal'),
          if (showDateRangePicker) buildDateRangePicker(),
        ],
      ),
    );
  }

  Widget buildStatusFilter(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatusIndex = index;
        });
      },
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Icon(
            selectedStatusIndex == index
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color:
                selectedStatusIndex == index ? Color(0xff17C82A) : Colors.black,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget buildTimeRangeFilter(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeRangeIndex = index;
          if (index == 2) {
            showDateRangePicker = true;
          } else {
            showDateRangePicker = false;
          }
        });
      },
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Icon(
            selectedTimeRangeIndex == index
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: selectedTimeRangeIndex == index
                ? Color(0xff17C82A)
                : Colors.black,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget buildDateRangePicker() {
    return Column(
      children: [
        Container(
          child: Row(children: [
            GestureDetector(
                onTap: () async {
                  final initialDate = DateTime.now();
                  final selected = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (selected != null) {
                    setState(() {
                      selectedStartDate = selected;
                    });
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.black26,
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text('Tanggal Awal:'),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(Icons.calendar_month),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              '${DateFormat('dd MMM yyyy').format(selectedStartDate)}'),
                        ),
                      ]),
                )),
            CustomPaint(
              painter: DashedLinePainter(),
              size: Size(40, 8),
            ),
            GestureDetector(
                onTap: () async {
                  final initialDate = DateTime.now();
                  final selected = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (selected != null) {
                    setState(() {
                      selectedEndDate = selected;
                    });
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.black26,
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text('Tanggal Akhir:'),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(Icons.calendar_month),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              '${DateFormat('dd MMM yyyy').format(selectedEndDate)}'),
                        ),
                      ]),
                )),
          ]),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                _resetFilter();
              },
              style: ButtonStyle(
                // padding: MaterialStateProperty.all<EdgeInsets>(
                //     EdgeInsets.symmetric(horizontal: 50, vertical: 12)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Color(0xff7E8CA0)),
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 140,
                child: Text(
                  'Reset',
                  style: TextStyle(color: Color(0xff7E8CA0)),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff17C82A)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 140,
                child: Text(
                  'Terapkan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _resetFilter() {
    setState(() {
      selectedStatusIndex = defaultStatusIndex;
      selectedTimeRangeIndex = defaultTimeRangeIndex;
      showDateRangePicker = false;
    });
  }
}
