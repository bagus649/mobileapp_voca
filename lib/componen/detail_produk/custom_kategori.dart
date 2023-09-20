import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HargaDiskonController extends GetxController {
  var selectedHargaDiskon = "".obs;

  void setHargaDiskon(String hargaDiskon) {
    selectedHargaDiskon.value = hargaDiskon;
  }
}

enum ItemType {
  diamond,
  weeklyPass,
  twilightPass,
}

class KategoriProduk extends StatefulWidget {
  final void Function(ItemType? selected) onItemSelected;

  KategoriProduk({required this.onItemSelected});

  @override
  _KategoriProdukState createState() => _KategoriProdukState();
}

class _KategoriProdukState extends State<KategoriProduk> {
  final HargaDiskonController hargaDiskonController =
      Get.put(HargaDiskonController());

  ItemType selectedItem = ItemType.diamond;
  int selectedProductIndex = -1;

  Widget _buildSelectedItem(ItemType type) {
    final List<Map<String, String>> diamonds = [
      {
        'harga_diskon': '9.500',
        'total_diskon': 'Informasi',
        'harga_awal': '8.500',
        'gambar1': 'assets/images/diamond3.png',
        'deskripsi': '20 Diamonds (40 + 4 Bonus)',
        'judulitem': 'Diamond',
      },
      {
        'harga_diskon': '14.000',
        'total_diskon': 'Informasi',
        'harga_awal': '16.500',
        'gambar1': 'assets/images/diamond3.png',
        'deskripsi': '44 Diamonds (40 + 4 Bonus)',
        'judulitem': 'Diamond',
      },
      {
        'harga_diskon': '20.500',
        'total_diskon': 'Informasi',
        'harga_awal': '22.500',
        'gambar1': 'assets/images/diamond3.png',
        'deskripsi': '68 Diamonds (40 + 4 Bonus)',
        'judulitem': 'Diamond',
      },
    ];

    final List<Map<String, String>> weeklypass = [
      {
        'harga_diskon': '12.500',
        'total_diskon': 'Informasi',
        'harga_awal': '23.500',
        'gambar1': 'assets/images/weekly_pass2.png',
        'judulitem': 'Weekly Pass',
        'deskripsi': '120 Diamonds (7 Hari)',
      },
      {
        'harga_diskon': '18.500',
        'total_diskon': 'Informasi',
        'harga_awal': '',
        'gambar1': 'assets/images/weekly_pass2.png',
        'judulitem': 'Weekly Pass',
        'deskripsi': '140 Diamonds (7 Hari)',
      },
      {
        'harga_diskon': '29.500',
        'total_diskon': 'Informasi',
        'harga_awal': '33.500',
        'gambar1': 'assets/images/weekly_pass2.png',
        'judulitem': 'Weekly Pass',
        'deskripsi': '180 Diamonds (7 Hari)',
      },
    ];

    final List<Map<String, String>> twilightpass = [
      {
        'harga_diskon': '91.500',
        'total_diskon': 'Informasi',
        'harga_awal': '94.500',
        'gambar1': 'assets/images/twilight_pass.png',
        'judulitem': 'Twilight Pass',
        'deskripsi': '120 Diamonds (7 Hari)',
      },
      {
        'harga_diskon': '95.500',
        'total_diskon': 'Informasi',
        'harga_awal': '96.500',
        'gambar1': 'assets/images/twilight_pass.png',
        'judulitem': 'Twilight Pass',
        'deskripsi': '140 Diamonds (7 Hari)',
      },
      {
        'harga_diskon': '99.500',
        'total_diskon': 'Informasi',
        'harga_awal': '',
        'gambar1': 'assets/images/twilight_pass.png',
        'judulitem': 'Twilight Pass',
        'deskripsi': '180 Diamonds (7 Hari)',
      },
    ];

    switch (type) {
      case ItemType.diamond:
        return Container(
          height: 320,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 158,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: diamonds.length,
            itemBuilder: (context, index) {
              return ModelKategoriItem(
                onTap: () {
                  setState(() {
                    selectedProductIndex = index;
                  });
                  final selectedHargaDiskon = diamonds[index]['harga_diskon'];
                  hargaDiskonController.setHargaDiskon(selectedHargaDiskon!);

                  widget.onItemSelected(selectedItem);
                },
                isSelected: selectedProductIndex == index,
                gambar1: diamonds[index]['gambar1']!,
                harga_awal: diamonds[index]['harga_awal']!,
                harga_diskon: diamonds[index]['harga_diskon']!,
                judulitem: diamonds[index]['judulitem']!,
                total_diskon: diamonds[index]['total_diskon']!,
                deskripsi: diamonds[index]['deskripsi']!,
              );
            },
          ),
        );

      case ItemType.weeklyPass:
        return Container(
          height: 320,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 158,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: weeklypass.length,
            itemBuilder: (context, index) {
              return ModelKategoriItem(
                onTap: () {
                  setState(() {
                    selectedProductIndex = index;
                  });
                  final selectedHargaDiskon = weeklypass[index]['harga_diskon'];
                  hargaDiskonController.setHargaDiskon(selectedHargaDiskon!);

                  widget.onItemSelected(selectedItem);
                },
                isSelected: selectedProductIndex == index,
                gambar1: weeklypass[index]['gambar1']!,
                harga_awal: weeklypass[index]['harga_awal']!,
                harga_diskon: weeklypass[index]['harga_diskon']!,
                judulitem: weeklypass[index]['judulitem']!,
                total_diskon: weeklypass[index]['total_diskon']!,
                deskripsi: weeklypass[index]['deskripsi']!,
              );
            },
          ),
        );

      case ItemType.twilightPass:
        return Container(
          height: 320,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 158,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: twilightpass.length,
            itemBuilder: (context, index) {
              return ModelKategoriItem(
                onTap: () {
                  setState(() {
                    selectedProductIndex = index;
                  });
                  final selectedHargaDiskon =
                      twilightpass[index]['harga_diskon'];
                  hargaDiskonController.setHargaDiskon(selectedHargaDiskon!);

                  widget.onItemSelected(selectedItem);
                },
                isSelected: selectedProductIndex == index,
                gambar1: twilightpass[index]['gambar1']!,
                harga_awal: twilightpass[index]['harga_awal']!,
                harga_diskon: twilightpass[index]['harga_diskon']!,
                judulitem: twilightpass[index]['judulitem']!,
                total_diskon: twilightpass[index]['total_diskon']!,
                deskripsi: twilightpass[index]['deskripsi']!,
              );
            },
          ),
        );
    }
  }

  Widget _buildItemButton(ItemType type) {
    String imageName = '';
    String keterangan = '';

    switch (type) {
      case ItemType.diamond:
        imageName = 'assets/images/diamond2.png';
        keterangan = 'Diamond ';
        break;
      case ItemType.weeklyPass:
        imageName = 'assets/images/weekly_pass.png';
        keterangan = 'Weekly Pass ';
        break;
      case ItemType.twilightPass:
        imageName = 'assets/images/twilight_pass.png';
        keterangan = 'Twilight Pass ';
        break;
    }
    bool isSelected = selectedItem == type;
    return InkWell(
      onTap: () {
        setState(() {
          selectedItem = type;
          selectedProductIndex = -1;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 16),
        width: 92,
        height: 92,
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 194, 242, 198).withOpacity(0.24)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Color(0xff1AC727).withOpacity(0.40)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageName,
              width: 60,
              height: 60,
            ),
            SizedBox(height: 4),
            Text(
              keterangan,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildItemButton(ItemType.diamond),
                _buildItemButton(ItemType.weeklyPass),
                _buildItemButton(ItemType.twilightPass),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Pilih Item',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildSelectedItem(selectedItem),
          ],
        ),
      ),
    );
  }
}

class ModelKategoriItem extends StatelessWidget {
  final String judulitem;
  final String gambar1;
  final String harga_awal;
  final String harga_diskon;
  final String total_diskon;
  final String deskripsi;
  final bool isSelected;
  final void Function() onTap;

  ModelKategoriItem({
    required this.judulitem,
    required this.harga_awal,
    required this.harga_diskon,
    required this.total_diskon,
    required this.gambar1,
    required this.deskripsi,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isSelected
                ? Color(0xff00FF19).withOpacity(0.52)
                : Color(0xffDDFFE0),
            isSelected ? Color(0xff00FFB2) : Color(0xffffffff)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Color(0xff17C82A) : Colors.transparent,
          width: 2.0,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        judulitem,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          gambar1,
                          height: 40,
                          width: 40,
                          fit: BoxFit.contain,
                        ),
                        margin: EdgeInsets.only(right: 16, top: 0),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                deskripsi,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: 'Rp. $harga_awal',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        RichText(
                          text: TextSpan(
                            text: 'Rp. $harga_diskon',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xFF17C82A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 44),
                    child: SvgPicture.asset(
                      'assets/icons/Information_circle.svg',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      total_diskon,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
