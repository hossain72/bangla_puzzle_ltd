import 'package:get/get.dart';

import '../providers/product_provider.dart';

import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final productList = <Product>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllProduct();
  }

  getAllProduct() async {
    try {
      isLoading(true);
      var products = await ProductProvider().getProducts();
      if (products.isNotEmpty) {
        productList.addAll(products);
        update();
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  double getDiscountProductPrice(double price) {
    late double _discountPrice = (price * 26) / 100;
    late double _productPrice = price - _discountPrice;
    return _productPrice;
  }
}
