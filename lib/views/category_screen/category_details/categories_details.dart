import 'package:emart_app_ui/views/category_screen/category_details/item_details/item_details.dart';
import 'package:emart_app_ui/widgers_common/bg_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
   const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),

        ),
       body:Container(
         padding: EdgeInsets.all(12),
         child: Column(
           children: [
             SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: List.generate(6, (index) => "Baby Clothing".text.size(12).fontFamily(semibold).color(fontGrey).makeCentered().box.white.size(120, 60).rounded.margin(EdgeInsets.symmetric(horizontal: 4)).make()),
               ),
             ),
             20.heightBox,
             // Items Container
             Expanded(child: GridView.builder(
               physics: BouncingScrollPhysics(),
               shrinkWrap: true,
                 itemCount: 6,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                   mainAxisExtent: 250,
                   mainAxisSpacing: 8,
                   crossAxisSpacing: 8
                 ),
                 itemBuilder:(context, index) {
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Image.asset(imgP5,width: 200,height: 150,fit: BoxFit.cover,),


                       "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                       10.heightBox,
                       "\$ 600".text.color(redColor).fontFamily(bold).size(16).make(),
                       10.heightBox,
                     ],

                   ).box.white.margin(const EdgeInsets.all(4)).roundedSM.outerShadowSm.padding(const EdgeInsets.all(12)).make().onTap(() {
                     Get.to(()=>ItemDetails(title: "Dummy Item",));
                   });
                 },
             ))
           ],
         ),
       ) ,
      )
    );
  }
}
