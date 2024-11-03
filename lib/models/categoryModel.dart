import 'dart:convert';

class CategoryModel {
  final String name;
  final List<String> subCategory;

  CategoryModel({required this.name, required this.subCategory});

  // Factory method to create an instance from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      subCategory: List<String>.from(json['sub_category']),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sub_category': subCategory,
    };
  }
}

// Function to parse the entire JSON
CategoryModel categoryModelFromJson(String str)  => CategoryModel.fromJson(json.decode(str));


// Example function to convert list to JSON (optional)
String categoryModelToJson(List<CategoryModel> data) {
  final jsonData = data.map((x) => x.toJson()).toList();
  return json.encode({'categories': jsonData});
}
