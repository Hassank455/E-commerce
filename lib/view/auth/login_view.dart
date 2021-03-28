import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/register_view.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_button_social.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Welcome',
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: 'Sign Up',
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomText(
                  text: 'Sign in to Continue',
                  color: Colors.grey,
                  fontSize: 14,
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'iamdavid@gmail.com',
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                  text: 'Password',
                  hint: '**********',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(height: 20),
                CustomText(
                  text: 'Forget Password?',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    if(_formKey.currentState.validate()){
                      controller.signInEmailAndPassword();
                    }

                  },
                  text: 'SIGN IN',
                ),
                SizedBox(height: 20),
                CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20),
                CustomButtonSocial(
                  text: 'Sign In with Facebook',
                  onPressed: () {
                    controller.facebookSignInMethod();
                  },
                  imageName: 'assets/images/facebook.png',
                ),
                SizedBox(height: 20),
                CustomButtonSocial(
                  text: 'Sign In with Google',
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  imageName: 'assets/images/google.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
