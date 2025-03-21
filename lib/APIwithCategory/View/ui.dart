import 'package:api/APIwithCategory/View/2nd%20pge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/controllerProduct.dart';

void main()
{
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: ()=>ProductHome()),
      GetPage(name: '/categoryDetails', page: ()=>CategoryDetailScreen()),
    ],
   ));
}

class ProductHome extends StatelessWidget {
  final ProductControllerr productController = Get.put(ProductControllerr());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SizedBox(
        child: Obx((){
          if(productController.isLoadingCategories.value)
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else
          {
            return ListView.builder(itemBuilder: (context,index){
              String Category= productController.mainCategories[index];
                return ListTile(
                  title: Text(Category),
                    onTap: ()=>Get.toNamed('/categoryDetails',arguments: Category ),
                );
              },itemCount: productController.mainCategories.length,);
          }
        }),
      ),
    );
  }
}

