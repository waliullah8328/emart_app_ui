import 'package:emart_app_ui/consts/list.dart';
import 'package:emart_app_ui/controller/auth_controller.dart';
import 'package:emart_app_ui/views/account_screen/common/details_card.dart';
import 'package:emart_app_ui/views/account_screen/edit_profile.dart';
import 'package:emart_app_ui/views/auth_screen/login_screen.dart';
import 'package:emart_app_ui/widgers_common/bg_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [

              // Edit Profile Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                    child: Icon(Icons.edit,color: whiteColor,)).onTap(() {
                      Get.to(()=>EditProfileScreen());

                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Image.asset(imgProfile2,width: 80,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.fontFamily(semibold).white.make(),
                        "customer@example.com".text.white.make()
                      ],
                    )),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: whiteColor
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                        onPressed: () async {
                       await  Get.put(AuthController()).signoutMethod();
                       Get.offAll(()=>const LoginScreen());
                        }, child: logout.text.fontFamily(semibold).white.make())
                  ],
                ),
              ),

              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 detailsCard(count: "00",title: "in your cart",width: context.screenWidth/3.4),
                 detailsCard(count: "32",title: "in your wishList",width: context.screenWidth/3.4),
                 detailsCard(count: "675",title: "your orders",width: context.screenWidth/3.4),


                ],
              ),
             // 40.heightBox,

              // Button Sections
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: lightGrey,
                  );

                },
                itemCount:profileButtonList.length,
                  itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(profileButtonIconList[index],width: 22,color: darkFontGrey,),
                    title: "${profileButtonList[index]}".text.fontFamily(semibold).make(),

                  );


                  },
              ).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
            ],
          ),
        ),
      )
    );
  }
}
