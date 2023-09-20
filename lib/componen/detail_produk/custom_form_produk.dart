import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:mobile/services/service_provider.dart';

import '../../models/json_detail_products.dart';

class CustomFormController extends GetxController {
  final userId = ''.obs;
  final zoneId = ''.obs;
  final whatsappNumber = ''.obs;
  final Rx<DropdownItem?> selectedDropdownItem = Rx<DropdownItem?>(null);
  final DropdownController dropdownController = Get.put(DropdownController());

  final RxString fieldPlaceholder = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setFieldPlaceholder(String value) {
    fieldPlaceholder.value = value;
  }
}

class DropdownController extends GetxController {
  final RxString selectedValue = RxString('');
  final RxList<String> dropdownItems = RxList<String>([]);
}

class DropdownItem {
  final String value;
  final String label;

  DropdownItem(this.value, this.label);
}

class CustomForm extends StatefulWidget {
  final String slug;

  CustomForm({required this.slug});

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  String? instructionText;
  List<Field>? fields;
  List<String> dropdownItems = [];
  String? selectedValue;
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController zoneIdController = TextEditingController();
  final whatsappNumberController = TextEditingController();
  final CustomFormController controller = Get.put(CustomFormController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ambilData();
    });
  }

  Future<void> ambilData() async {
    try {
      var response = await ServiceProvider.getData('/product/${widget.slug}');
      if (response != null) {
        var jsonString = json.encode(response.data);
        DetailProducts data = detailProductsFromJson(jsonString);

        setState(() {
          instructionText = data.userInput?.instructionText;
          fields = data.userInput?.fields;

          if (fields != null) {
            for (var field in fields!) {
              if (field.attrs?.datas != null) {
                dropdownItems =
                    field.attrs!.datas!.map((item) => item.text!).toList();
              }
            }
          }

          controller.setFieldPlaceholder(instructionText ?? '');
        });
        userIdController.text = '';
        zoneIdController.text = '';
        whatsappNumberController.text = '';
      }
    } catch (error) {
      print('Error in HTTP request: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Text(
                    'Informasi Pesanan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (instructionText != null &&
                          instructionText!.isNotEmpty) {
                        _showInfoDialog(context, instructionText);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Image.asset(
                        'assets/icons/tandatanya.png',
                        fit: BoxFit.fill,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ],
              )),
          if (fields != null)
            GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 0,
                mainAxisExtent: 100,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: fields!.length,
              itemBuilder: (BuildContext context, int index) {
                final field = fields![index];
                if (field.tag == 'input') {
                  if (field.attrs?.name == 'userId') {
                    return CustomFormField(
                      fieldController: userIdController,
                      fieldPlaceholder: field.attrs?.placeholder,
                      fieldName: field.attrs?.name,
                      fieldType: field.attrs?.type,
                      instructionText: instructionText,
                      controller: controller,
                    );
                  } else {
                    return CustomFormField(
                      fieldController: zoneIdController,
                      fieldPlaceholder: field.attrs?.placeholder,
                      fieldName: field.attrs?.name,
                      fieldType: field.attrs?.type,
                      instructionText: instructionText,
                      controller: controller,
                    );
                  }
                } else if (field.tag == 'dropdown') {
                  List<String> dropdownItems = [];

                  if (field.attrs?.datas != null) {
                    dropdownItems =
                        field.attrs!.datas!.map((item) => item.text!).toList();
                  } else {
                    dropdownItems.add('Pilih');
                  }
                  return CustomDropdownFormField(
                    fieldName: field.attrs?.name,
                    fieldPlaceholder: field.attrs?.placeholder,
                    dropdownItems: dropdownItems
                        .map((item) => DropdownItem(item, item))
                        .toList(),
                    selectedValue: selectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                      controller.selectedDropdownItem.value =
                          DropdownItem(newValue ?? '', newValue ?? '');
                    },
                    dropdownController: controller.dropdownController,
                  );
                }
                return SizedBox();
              },
            ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Masukan WhatsApp Number'),
                SizedBox(height: 8),
                TextFormField(
                  controller: whatsappNumberController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    controller.whatsappNumber.value = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter WhatsApp Number',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class CustomDropdownFormField extends StatefulWidget {
  final String? fieldName;
  final String? fieldPlaceholder;
  final List<DropdownItem> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final String? selectedValue;
  final DropdownController dropdownController;
  CustomDropdownFormField({
    this.fieldName,
    this.fieldPlaceholder,
    required this.dropdownItems,
    this.onChanged,
    this.selectedValue,
    required this.dropdownController,
  });

  @override
  _CustomDropdownFormFieldState createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Text(widget.fieldPlaceholder ?? ''),
              SizedBox(width: 8),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<DropdownItem>(
              isExpanded: true,
              hint: Text(widget.fieldPlaceholder ?? ''),
              value: widget.selectedValue != null
                  ? widget.dropdownItems.firstWhere(
                      (item) => item.value == widget.selectedValue,
                      orElse: () => widget.dropdownItems[0],
                    )
                  : null,
              onChanged: (newValue) {
                setState(() {
                  isDropdownOpen = false;
                });
                widget.onChanged?.call(newValue?.value);
              },
              items: widget.dropdownItems.map((item) {
                return DropdownMenuItem<DropdownItem>(
                  value: item,
                  child: Text(item.label),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFormField extends StatelessWidget {
  final TextEditingController fieldController;
  final String? fieldName;
  final String? fieldPlaceholder;
  final String? instructionText;
  final String? fieldType;
  final CustomFormController controller;

  CustomFormField({
    required this.fieldController,
    this.fieldName,
    this.instructionText,
    this.fieldPlaceholder,
    this.fieldType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isNumberField = fieldType == "number";

    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fieldPlaceholder ?? ''),
          SizedBox(height: 8),
          TextFormField(
            controller: fieldController,
            inputFormatters:
                isNumberField ? [FilteringTextInputFormatter.digitsOnly] : [],
            onChanged: (value) {
              if (fieldName == 'userId') {
                controller.userId.value =
                    value.isNotEmpty ? value : controller.userId.value;
              } else if (fieldName == 'zoneId') {
                controller.zoneId.value =
                    value.isNotEmpty ? value : controller.zoneId.value;
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Enter $fieldName',
            ),
          ),
        ],
      ),
    );
  }
}

void _showInfoDialog(BuildContext context, String? instructionText) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(0.2),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 44, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  if (instructionText != null)
                    Text(
                      'Instruction: $instructionText',
                      style: TextStyle(fontSize: 16),
                    ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
