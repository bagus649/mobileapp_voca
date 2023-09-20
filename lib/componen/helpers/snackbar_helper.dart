import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:voca_mobile_app/constants/colors_constant.dart';

class SnackbarHelper {
  static showError({required String description}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(GetBar(
        message: "😢 $description",
        mainButton: GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.close,
              // color: AppColors.whiteColor,
              color: Colors.white,
            ),
          ),
        ),
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        borderRadius: 4,
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 1),
        // backgroundColor: AppColors.dangerColor,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      ));
    }
  }

  static showSuccess({required String description}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(GetBar(
        message: "👌 $description",
        mainButton: GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.close,
              color: Colors.white,
              // color: AppColors.whiteColor,
            ),
          ),
        ),
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        borderRadius: 4,
        backgroundColor: Colors.green,
        // backgroundColor: AppColors.successColor,
        snackPosition: SnackPosition.TOP,
      ));
    }
  }

  static showInfo({required String description}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(GetBar(
        message: "ℹ $description",
        mainButton: GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.close,
              color: Colors.white,
              // color: AppColors.whiteColor,
            ),
          ),
        ),
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        animationDuration: Duration(seconds: 1),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        borderRadius: 4,
        backgroundColor: Colors.blue,
        // backgroundColor: AppColors.infoColor,
        snackPosition: SnackPosition.TOP,
      ));
    }
  }
}
