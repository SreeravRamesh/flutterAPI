import 'package:api/API%203,%20Dio/utilities/colors.dart';
import 'package:api/API%203,%20Dio/utilities/const_snackbar.dart';
import 'package:api/API4/controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main()
{
  runApp(MaterialApp(home: DioHomee(),));
}

class DioHomee extends StatelessWidget {
  DataControllers controller = Get.put(DataControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dio Home"),
          backgroundColor: MyColors.cgColor,
        ),
        backgroundColor: MyColors.bgColor,
        floatingActionButton:
        Obx(()=> controller.isNetConnected.value ? FloatingActionButton(
          onPressed: (){
            controller.isListDown.value
                ? controller.scrollToUp()
                : controller.scrollToDown();
          },
          child: FaIcon(controller.isListDown.value
              ? FontAwesomeIcons.arrowUp
              : FontAwesomeIcons.arrowDown),
        ):Container()),

        body: Obx(()=>
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: controller.isNetConnected.value == true
                    ? (controller.isLoading.value
                    ? Center(
                    child: CircularProgressIndicator())
                    :getData())
                    :Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.network_check,size: 100,),
                      MaterialButton(onPressed: ()async{
                        if(await InternetConnectionChecker().hasConnection == true)
                        {
                          controller.fetchDatas();
                        }
                        else
                        {
                          showCustomSnackBAr(context);
                        }
                      })
                    ],
                  ),
                )
            ),
        )
    );
  }

  getData() {
    return RefreshIndicator(
        child: ScrollablePositionedList.builder(
            itemScrollController: controller.scrollController,
            itemCount: controller.datas.length,
            itemBuilder: (context,index){
              var data = controller.datas[index];
              return Card(
               child: ListTile(
                 // leading: CircleAvatar(
                   // backgroundColor: MyColors.bgColor,
                    //child: Text(data.id.toString()),
                  //),
                  title: Text('${data.users!}'),
                  subtitle: Text('${data.total!}'),
                ),
              );
            }),
        onRefresh: (){
          return controller.fetchDatas();
        });
  }
}
