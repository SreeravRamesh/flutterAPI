import 'package:api/Api1/Service/apiService.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit(){
    getProducts();
    super.onInit();
  }

  void getProducts()async{
    try{
      isLoading(true);
      var products = await HttpService.fetchProductus();
      if(products != null)
        {
          productList.value = products;
        }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}