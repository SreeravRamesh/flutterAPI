import 'package:api/API%203,%20Dio/service/dioService.dart';
import 'package:api/API4/Model.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DataControllers extends GetxController{

  @override
  void onInit(){
    fetchDatas();
    isNetworkconnected();
    super.onInit();


  }

  RxList<DataModelNew> datas = RxList();
  RxBool isLoading = true.obs;
  RxBool isListDown = false.obs;
  RxBool isNetConnected = true.obs;

  var scrollController = ItemScrollController();

  void isNetworkconnected() async{
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }

  fetchDatas() async{
    isNetworkconnected();
    isLoading.value = true;
    var response = await DioServices().getData();
    if(response.statusCode==200){
      response.data.forEach((data){
        datas.add(DataModelNew.fromJson(data));
      });
      isLoading.value = false;
    }
  }

  scrollToDown(){
    scrollController.scrollTo(
        index: datas.length,
        duration: const Duration(seconds: 4),
        curve: Curves.bounceInOut);
    isListDown.value = false;
  }

  scrollToUp(){
    scrollController.scrollTo(
        index: 0,
        duration: const Duration(seconds: 4),
        curve: Curves.fastOutSlowIn);
    isListDown.value = false;
  }

}