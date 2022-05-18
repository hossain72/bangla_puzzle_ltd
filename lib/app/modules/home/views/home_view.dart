import 'package:bangla_puzzel_ltd/app/modules/home/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.grey.shade200,
        child: Obx(() => controller.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10);
                      },
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.productList.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ProductWidget(
                          product: controller.productList[index],
                        );
                      }),
                ),
              )),
      ),
    );
  }
}
