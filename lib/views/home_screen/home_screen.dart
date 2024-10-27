import 'package:emart_app_ui/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Init Home Controller
    var controller = Get.put(HomeController());

     var navBarItem = [
       BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,),label: home),
       BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,),label: categories),
       BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,),label: cart),
       BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,),label: account),
     ];

     var navBody = [
       Container(color: Colors.blue,),
       Container(color: Colors.amber,),
       Container(color: Colors.purple,),
       Container(color: Colors.cyan,),
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
        selectedLabelStyle: TextStyle(fontFamily: semibold),
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
          items: navBarItem)),
    );
  }
}
