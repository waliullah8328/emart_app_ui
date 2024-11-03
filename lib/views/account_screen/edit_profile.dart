

import 'dart:io';

import 'package:emart_app_ui/controller/profile_controller.dart';
import 'package:emart_app_ui/widgers_common/bg_widgets.dart';
import 'package:emart_app_ui/widgers_common/custom_textField.dart';
import 'package:emart_app_ui/widgers_common/our_button.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {

  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           data["imageUrl"] =="" && controller.profileImagePath.isEmpty?  Image.asset(imgProfile2,width: 80,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                : data["imageUrl"] !="" && controller.profileImagePath.isEmpty?
           Image.network(data["imageUrl"],width: 80,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
           :
           Image.file(File(controller.profileImagePath.value,),width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(title: "Change", color: redColor, textColor: whiteColor, onPress: (){
              controller.changeImage(context);
            }),
            Divider(),
            20.heightBox,
            customTextField(hintText: nameHint,title: name,controller: controller.nameTEController),
            10.heightBox,
            customTextField(hintText: passwordHint,title: oldPassword,isPass: true,controller: controller.oldPasswordTEController),
            10.heightBox,
            customTextField(hintText: passwordHint,title: newPassword,isPass: true,controller: controller.newPasswordTEController),
            20.heightBox,
           controller.isLoading.value? CircularProgressIndicator(valueColor:AlwaysStoppedAnimation(redColor) ,): SizedBox(
              width: context.screenWidth-60,
                child: ourButton(title: "Save", color: redColor, textColor: whiteColor, onPress: ()async{
                  controller.isLoading(true);

                  // if image is not selected
                  if(controller.profileImagePath.value.isNotEmpty){
                    await controller.uploadProfileImage();

                  }
                  else{
                    controller.profileImageLink = data["imageUrl"];

                  }

                  // If old password matches database
                  if(data["password"] == controller.oldPasswordTEController.text){
                    await controller.changeAuthPassword(
                      email: data["email"],
                      password: controller.oldPasswordTEController.text,
                      newPassword: controller.newPasswordTEController.text
                    );
                    await controller.updateProfile(
                        imgUrl: controller.profileImageLink,
                        name: controller.nameTEController.text,
                        password: controller.newPasswordTEController.text
                    );
                    VxToast.show(context, msg: "Updated");
                    controller.isLoading(false);

                  }else{
                    VxToast.show(context, msg: "Wrong old password");
                    controller.isLoading(false);
                  }


                })),
          ],

        ).box.shadowSm.white.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 20,left: 12,right: 12)).rounded.make()),
      )
    );
  }
}
