import 'package:get/get.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductViewModel extends GetxController {
  var isLoading = true.obs;
  var products = <Product>[].obs;
  var isGridView = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var fetchedProducts = await ProductService.fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products');
    } finally {
      isLoading(false);
    }
  }

  void toggleViewMode() {
    isGridView.value = !isGridView.value;
  }
}
