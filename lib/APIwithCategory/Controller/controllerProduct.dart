import 'package:api/APIwithCategory/Service/serviceApi.dart';
import 'package:get/get.dart';

class ProductControllerr extends GetxController {
  var mainCategories = <String>[].obs;
  var productsByCategory = <Map<String, dynamic>>[].obs;
  var isLoadingCategories = true.obs;
  var isLoadingProducts = true.obs;


  @override
  void onInit() {
    super.onInit();
    fetchMainCategories();
  }

  Future<void> fetchMainCategories() async {
    try {
      isLoadingCategories(true);
      var response = await FakestoreService().getMainCategories();
      mainCategories.assignAll(response);
    }
    finally {
      isLoadingCategories(false);
    }
  }

  Future<void> fetchProductByCategory(String category) async {
    try {
      isLoadingProducts(true);
      var response = await FakestoreService().getProductsByCategory(category);
      productsByCategory.assignAll(response);
    }
    finally {
      isLoadingProducts(false);
    }
  }
}