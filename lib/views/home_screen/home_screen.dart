import 'package:emart_app_ui/consts/list.dart';
import 'package:emart_app_ui/views/home_screen/components/featured_button.dart';
import 'package:emart_app_ui/widgers_common/home_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(

              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                filled: true,
                focusColor: whiteColor,
                hintText: searchAnything,
                hintStyle: TextStyle(color: textfieldGrey),


              ),
            ),
          ),
          10.heightBox,

          // Swiper Brands
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  VxSwiper.builder(
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    itemCount: sliderList.length, itemBuilder: (context, index) {
                    return Image.asset(sliderList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
                  },),
                  10.heightBox,
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(2, (index) => homeButtons(
                    height: context.screenHeight * 0.15,
                    width: context.screenWidth / 2.5,
                    icon: index == 0? icTodaysDeal: icFlashDeal,
                    title: index == 0? todayDeal: flashSale,
            
                  )),),
            
                  10.heightBox,
                  VxSwiper.builder(
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    itemCount: secondSliderList.length, itemBuilder: (context, index) {
                    return Image.asset(secondSliderList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
                  },),
            
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) => homeButtons(
                      height: context.screenHeight * 0.15,
                      width: context.screenWidth / 3.5,
                      icon: index == 0? icCategories: index == 1? icBrands:icTopSeller,
                      title: index == 0? topCategories:index == 1? brand: topSeller,
            
                    )),),
                  20.heightBox,
            
                  // Featured Categories
                  Align(
                    alignment: Alignment.centerLeft,
                      child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(3, (index) => Column(
                      children: [
                        featuredButton(icon: featuredImage1[index],title: featuredTitle1[index]),
                        10.heightBox,
                        featuredButton(icon: featuredImage2[index],title: featuredTitle2[index]),

                      ],
                    )).toList(),),
                  ),

                  // Featured Product
                  20.heightBox,

                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProduct.text.white.fontFamily(bold).size(18).make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection:  Axis.horizontal,
                          child: Row(children: List.generate(6, (index) =>Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(imgP1,width: 150,fit: BoxFit.cover,),
                              10.heightBox,
                              "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                              10.heightBox,
                              "\$ 600".text.color(redColor).fontFamily(bold).size(16).make(),
                            ],

                          ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(8)).make()),),
                        )

                      ],
                    ),
                  ),

                  // Third Swipper
                  20.heightBox,
                  VxSwiper.builder(
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    itemCount: secondSliderList.length, itemBuilder: (context, index) {
                    return Image.asset(secondSliderList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
                  },),

                  20.heightBox,
                  // All Product Section
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300
                      ),
                      itemBuilder:(context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imgP5,width: 200,height: 200,fit: BoxFit.cover,),
                            Spacer(),

                            "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\$ 600".text.color(redColor).fontFamily(bold).size(16).make(),
                            10.heightBox,
                          ],

                        ).box.white.margin(EdgeInsets.all(4)).roundedSM.padding(EdgeInsets.all(12)).make();
                      },),
            
                  
                ],
              ),
            ),
          ),



        ],
      )),

    );
  }
}
