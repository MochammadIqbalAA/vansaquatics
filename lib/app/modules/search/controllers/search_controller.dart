import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchResults = <QueryDocumentSnapshot>[].obs; // Hasil pencarian
  var searchQuery = ''.obs; // Query pencarian

  // Fungsi untuk mencari produk berdasarkan nama
  void searchProducts(String query) async {
    searchQuery.value = query; // Update query pencarian

    if (query.isEmpty) {
      searchResults.clear(); // Kosongkan hasil pencarian jika query kosong
    } else {
      try {
        // Query ke Firestore untuk mencari produk berdasarkan nama
        var results = await FirebaseFirestore.instance
            .collection('products')
            .where('name', isGreaterThanOrEqualTo: query)
            .where('name', isLessThanOrEqualTo: query + '\uf8ff') // Pencarian berbasis string
            .get();

        searchResults.value = results.docs; // Update hasil pencarian
      } catch (e) {
        print('Error searching products: $e');
      }
    }
  }
}
