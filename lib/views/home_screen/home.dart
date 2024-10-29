import 'package:emart_app_ui/controller/home_controller.dart';
import 'package:emart_app_ui/views/account_screen/profile_screen.dart';
import 'package:emart_app_ui/views/cart_screen/cart_screen.dart';
import 'package:emart_app_ui/views/category_screen/category_screen.dart';
import 'package:emart_app_ui/views/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../consts/consts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    // Init Home Controller
    var controller = Get.put(HomeController());

     var navBarItem = [
       BottomNavigationBarItem(icon: Image.asset(icHome,width: 23,),label: home),
       BottomNavigationBarItem(icon: Image.asset(icCategories,width: 23,),label: categories),
       BottomNavigationBarItem(icon: Image.asset(icCart,width: 23,),label: cart),
       BottomNavigationBarItem(icon: Image.asset(icProfile,width: 23,),label: account),
     ];

     var navBody = [
       const HomeScreen(),
       const CategoryScreen(),
       const CartScreen(),
       const ProfileScreen(),
     ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value),)),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        onTap: (value){
          controller.currentNavIndex.value = value;
        },
        currentIndex: controller.currentNavIndex.value,
        selectedItemColor: redColor,
        selectedLabelStyle: const TextStyle(fontFamily: semibold),
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
          items: navBarItem)),
    );
  }
}
