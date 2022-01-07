import 'package:flutter_shop_x_implement_rest_api/app/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static Future<List<ProductModel>> fetchProduct() async {
    var response = await client.get(
      Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;

      // diambil dari model
      return productFromJson(jsonString);
      //
    } else {
      return null;
    }
  }
}
