

import 'package:emart_app_ui/consts/consts.dart';


Widget detailsCard({width, String? count, String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),

    ],
  ).box.white.rounded.width(width).padding(const EdgeInsets.all(3.2)).height(80).make();
}