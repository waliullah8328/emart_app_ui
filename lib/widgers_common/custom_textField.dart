import 'package:emart_app_ui/consts/consts.dart';


Widget customTextField({String? title, String? hintText, controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

     title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        decoration:  InputDecoration(
          hintStyle: const TextStyle(fontFamily: semibold,color: textfieldGrey),
          hintText: hintText,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
            )
          )

        ),
      ),
      5.heightBox,

    ],
  );
}