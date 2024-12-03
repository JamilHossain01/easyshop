import 'package:easyshop/views/product_gird.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/product_viewmodel.dart';
import 'product_list.dart';

class ProductListScreen extends StatelessWidget {
  final ProductViewModel controller = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopEasy'),
        actions: [
          IconButton(
            icon: Obx(() => Icon(
                  controller.isGridView.value
                      ? Icons.view_list
                      : Icons.grid_view,
                )),
            onPressed: controller.toggleViewMode,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.products.isEmpty) {
          return Center(child: Text('No products found.'));
        } else {
          return controller.isGridView.value
              ? ProductGrid(products: controller.products)
              : ProductList(products: controller.products);
        }
      }),
    );
  }
}
