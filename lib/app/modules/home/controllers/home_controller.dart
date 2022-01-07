import 'package:flutter_shop_x_implement_rest_api/app/data/models/product_model.dart';
import 'package:flutter_shop_x_implement_rest_api/app/data/services/api_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetcProduc();
    super.onInit();
  }

  void fetcProduc() async {
    try {
      isLoading(true);
      var productFromApi = await ApiServices.fetchProduct();

      if (productFromApi != null) {
        productList.value = productFromApi;
      }
    } catch (e) {
      print(e.message);
      //
    } finally {
      isLoading(false);
    }
  }
}
