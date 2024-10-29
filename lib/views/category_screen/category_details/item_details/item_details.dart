import 'package:emart_app_ui/widgers_common/our_button.dart';
import 'package:flutter/cupertino.dart';

import '../../../../consts/consts.dart';
import '../../../../consts/list.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.makeCentered(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Swipper Section
                  VxSwiper.builder(
                    autoPlay: true,
                      aspectRatio: 16/9,
                      height: 350,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(imgFc5,width: double.infinity,fit: BoxFit.cover,);

                      },
                  ),
                  10.heightBox,

                  // Title details Screen
                  title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  
                  // Rating
                  VxRating(
                    onRatingUpdate: (value){},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "\$ 30,000".text.color(redColor).fontFamily(bold).size(18).make(),
                  10.heightBox,
                  Row(children: [
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Seller".text.white.fontFamily(semibold).make(),
                        5.heightBox,
                        "In house Brands".text.fontFamily(semibold).color(darkFontGrey).make(),
                      ],
                    )),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.message_rounded,color: darkFontGrey,),
                    ),
                  ],).box.height(60).padding(EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),

                  // Color section
                  20.heightBox,

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children:List.generate(3, (index) =>VxBox().size(40, 40).color(Vx.randomPrimaryColor).margin(EdgeInsets.symmetric(horizontal: 4)).roundedFull.make()),
                          )

                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      // Quantity Row

                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children:[
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                              "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                              10.widthBox,
                              "0 available".text.color(textfieldGrey).make()

                            ],
                          )

                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total: ".text.color(textfieldGrey).make(),
                          ),
                          "\$ 0.00".text.color(redColor).size(16).fontFamily(bold).make()

                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),


                    ],

                  ).box.white.shadowSm.make(),

                  // Description section
                  10.heightBox,

                  "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  "This is dummy item and dummy text here dont worry after a some time we will give you actual product details".text.color(darkFontGrey).make(),

                  10.heightBox,

                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate( itemDetailsButton.length, (index) => ListTile(
                      title: itemDetailsButton[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                      trailing: const Icon(Icons.arrow_forward_ios),


                    )),
                  ),
                  20.heightBox,
                  productAlsoLike.text.size(16).color(darkFontGrey).make(),
                  20.heightBox,
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


          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              title: "Add to Cart",
              color: redColor,
              textColor: whiteColor,
              onPress: (){

              }
          ),),

        ],
      ),

    );
  }
}
