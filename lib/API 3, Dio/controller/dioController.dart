import 'package:api/API%203,%20Dio/model/dioModel.dart';
import 'package:api/API%203,%20Dio/service/dioService.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DataController extends GetxController{

  @override
  void onInit(){
    fetchData();
    isnetworkconnected();
    super.onInit();

  }

  RxList<DataModel> datas = RxList();
  RxBool isLoading = true.obs;
  RxBool isListDown = false.obs;
  RxBool isNetConnected = true.obs;

  var scrollController = ItemScrollController();

  void isnetworkconnected() async{
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }

  fetchData() async{
    isnetworkconnected();
    isLoading.value = true;
    var response = await DioServices().getData();

    if(response.statusCode==200){
      print(response);

      response.data.forEach((data){
        datas.add(DataModel.fromJson(data));

      });
      isLoading.value = false;
    }
  }

  scrollToDown(){
    scrollController.scrollTo(
        index: datas.length,
        duration: const Duration(seconds: 4),
      curve: Curves.bounceInOut);
    isListDown.value = true;
  }

  scrollToUp(){
    scrollController.scrollTo(
        index: 0,
        duration: const Duration(seconds: 4),
      curve: Curves.fastOutSlowIn);
    isListDown.value = false;
  }

}