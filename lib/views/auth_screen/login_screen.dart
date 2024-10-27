import 'package:emart_app_ui/consts/consts.dart';
import 'package:emart_app_ui/consts/list.dart';
import 'package:emart_app_ui/views/auth_screen/sign_up_screen.dart';
import 'package:emart_app_ui/views/home_screen/home_screen.dart';
import 'package:emart_app_ui/widgers_common/app_logo_widget.dart';
import 'package:emart_app_ui/widgers_common/bg_widgets.dart';
import 'package:emart_app_ui/widgers_common/custom_textField.dart';
import 'package:emart_app_ui/widgers_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(title: email, hintText: emailHint),
                  customTextField(title: password, hintText: passwordHint),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  ourButton(
                    title: login,
                    color: redColor,
                    textColor: whiteColor,
                    onPress: () {
                      Get.to(()=> const HomeScreen());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                    title: signUp,
                    color: lightGolden,
                    textColor: redColor,
                    onPress: () {
                      Get.to(()=> const SignUpScreen());
                    },
                  ).box.width(context.screenWidth - 50).make(),

                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                                            backgroundColor: lightGrey,
                                            radius: 25,
                                            child: Image.asset(socialIconList[index],width: 30,),
                                          ),
                      )
                  )
                  ),


                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
            ],
          ),
        ),
      ),
    );
  }
}
