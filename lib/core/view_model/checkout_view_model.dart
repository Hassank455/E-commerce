import 'package:e_commerce_app/constance.dart';
import 'package:e_commerce_app/helper/enum.dart';
import 'package:e_commerce_app/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController {
  int get index => _index;
  int _index = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  String street1 , street2 , city, state , county;

  GlobalKey<FormState> formState = GlobalKey();

  void changeIndex(int i) {
    _index = i;
    if (_index == 1) {
      _pages = Pages.AddAddress;
    } else if (_index == 2) {
      _pages = Pages.Summary;
    } else if (_index == 3) {
      Get.to(ControlView());
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}
