import 'package:e_commerce_app/core/view_model/profile_view_model.dart';
import 'package:e_commerce_app/view/auth/login_view.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                image: DecorationImage(
                                    image: controller.userModel == null
                                        ? AssetImage('assets/images/Avatar.png')
                                        : controller.userModel.pic == 'default'
                                            ? AssetImage(
                                                'assets/images/Avatar.png')
                                            : NetworkImage(
                                                controller.userModel.pic,
                                              ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.userModel.name,
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                                CustomText(
                                  text: controller.userModel.email,
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                      buildContainerProfile(
                          'Edit Profile',
                          Image.asset('assets/menu_icon/Icon_Edit-Profile.png'),
                          () {}),
                      SizedBox(height: 20),
                      buildContainerProfile(
                          'Shipping Address',
                          Image.asset('assets/menu_icon/Icon_Location.png'),
                          () {}),
                      SizedBox(height: 20),
                      buildContainerProfile(
                          'Order History',
                          Image.asset('assets/menu_icon/Icon_History.png'),
                          () {}),
                      SizedBox(height: 20),
                      buildContainerProfile(
                          'Cards',
                          Image.asset('assets/menu_icon/Icon_Payment.png'),
                          () {}),
                      SizedBox(height: 20),
                      buildContainerProfile(
                          'Notification',
                          Image.asset('assets/menu_icon/Icon_Alert.png'),
                          () {}),
                      SizedBox(height: 20),
                      buildContainerProfile('Log Out',
                          Image.asset('assets/menu_icon/Icon_Exit.png'), () {
                        controller.signOut();
                        Get.offAll(LoginView());
                      }),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Container buildContainerProfile(
      String text, Image image, Function onPressed) {
    return Container(
      child: FlatButton(
        onPressed: onPressed,
        child: ListTile(
          title: CustomText(
            text: text,
          ),
          leading: image,
          trailing: Icon(Icons.navigate_next, color: Colors.black),
        ),
      ),
    );
  }
}
