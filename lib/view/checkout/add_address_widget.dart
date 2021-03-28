import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                CustomText(
                  text: 'Billing address is the same as delivery address',
                  fontSize: 20,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                  onSave: (value){
                    controller.street1 = value;
                  },
                  validator: (String value){
                    if(value)
                  },
                  text: 'Street 1',
                  hint: '21, Alex Davidson Avenue',
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                  text: 'Street 2',
                  hint: 'Opposite Omegatron, Vicent Quarters ',
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                  text: 'City',
                  hint: 'Victoria Island',
                ),
                SizedBox(height: 40),
                Container(
                  width: Get.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CustomTextFormField(
                            text: 'StatE',
                            hint: 'Lagos State',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CustomTextFormField(
                            text: 'Country',
                            hint: 'Nigeria',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
