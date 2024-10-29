import 'package:emart_app_ui/consts/list.dart';
import 'package:emart_app_ui/views/category_screen/category_details/categories_details.dart';
import 'package:emart_app_ui/widgers_common/bg_widgets.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200
              ),
              itemBuilder:  (context, index) {
                return Column(

                  children: [
                    Image.asset(categoriesImageList[index],height: 130,width: 200,fit: BoxFit.cover,),
                    10.heightBox,
                    "${categoriesList[index]}".text.color(darkFontGrey).align(TextAlign.center).make(),
                  ],

                ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                  Get.to(()=>CategoryDetails(title: categoriesList[index]));
                });
              },
          ),
        ),
      )
    );
  }
}
