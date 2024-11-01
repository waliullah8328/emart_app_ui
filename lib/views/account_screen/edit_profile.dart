import 'package:emart_app_ui/controller/profile_controller.dart';
import 'package:emart_app_ui/widgers_common/bg_widgets.dart';
import 'package:emart_app_ui/widgers_common/custom_textField.dart';
import 'package:emart_app_ui/widgers_common/our_button.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imgProfile2,width: 80,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(title: "Change", color: redColor, textColor: whiteColor, onPress: (){}),
            Divider(),
            20.heightBox,
            customTextField(hintText: nameHint,title: name),
            customTextField(hintText: passwordHint,title: password,isPass: true),
            20.heightBox,
            SizedBox(
              width: context.screenWidth-60,
                child: ourButton(title: "Save", color: redColor, textColor: whiteColor, onPress: (){})),
          ],

        ).box.shadowSm.white.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 20,left: 12,right: 12)).rounded.make(),
      )
    );
  }
}
