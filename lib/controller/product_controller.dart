import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/categoryModel.dart';

class ProductController extends GetxController{

  getSubCategories()async{
    var data = await rootBundle.load("lib/views/services/category_model.json");
    var decoded = categoryModelFromJson(data);
  }
}