import 'package:emart_app_ui/consts/consts.dart';
import 'package:emart_app_ui/consts/list.dart';
import 'package:emart_app_ui/widgers_common/app_logo_widget.dart';
import 'package:emart_app_ui/widgers_common/bg_widgets.dart';
import 'package:emart_app_ui/widgers_common/custom_textField.dart';
import 'package:emart_app_ui/widgers_common/our_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;

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
              "Join the $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(title: name, hintText: nameHint),
                  customTextField(title: email, hintText: emailHint),
                  customTextField(title: password, hintText: passwordHint),
                  customTextField(title: retypePassword, hintText: passwordHint),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),

                  Row(children: [
                    Checkbox(
                      activeColor: Colors.red,
                        value: isCheck, onChanged: (newValue){
                        setState(() {
                          isCheck = newValue;
                        });

                    }),
                    10.widthBox,


                    Expanded(
                      child: RichText(text: TextSpan(
                        children: [
                          TextSpan(text: "I agree to the ",style: TextStyle(fontFamily: regular,color: fontGrey)),
                          TextSpan(text: termsAndCondition,style: TextStyle(fontFamily: regular,color: redColor)),
                          TextSpan(text: " & ",style: TextStyle(fontFamily: regular,color: fontGrey)),
                          TextSpan(text: privacyPolicy,style: TextStyle(fontFamily: regular,color: redColor)),
                        ]
                      )),
                    ),


                  ],),
                  5.heightBox,
                  ourButton(
                    title: signUp,
                    color: isCheck == true? redColor: lightGrey,
                    textColor: whiteColor,
                    onPress: () {},
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadyHaveAccount.text.color(fontGrey).make(),
                      login.text.color(redColor).make().onTap(() {
                        Get.back();

                      })

                    ],
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
