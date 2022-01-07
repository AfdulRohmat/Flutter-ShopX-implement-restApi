import 'package:flutter/material.dart';
import 'package:flutter_shop_x_implement_rest_api/app/modules/home/widgets/product_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  @override
  var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          /// ==> UNTUK JUDUL
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ShopX',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.view_list_rounded),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.grid_view),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          //
          /// ==> UNTUK STAGGED GRID VIEW
          Expanded(
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: controller.productList.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder: (contex, index) {
                          return ProductTile(controller.productList[index]);
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
