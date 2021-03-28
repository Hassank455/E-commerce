import 'package:e_commerce_app/constance.dart';
import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Container(
              height: 350,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  child: Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            controller.cartProductModel[index].image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: controller.cartProductModel[index].name),
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          alignment: Alignment.bottomLeft,
                          text:
                              '\$ ${controller.cartProductModel[index].price.toString()}',
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
