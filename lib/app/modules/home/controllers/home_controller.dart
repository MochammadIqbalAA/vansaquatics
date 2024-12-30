import 'package:get/get.dart';

class HomeController extends GetxController {
  // Carousel images
  final List<String> carouselImages = [
    'assets/image1.png', // Ganti dengan path gambar carousel Anda
    'assets/image2.png',
    'assets/image3.png',
  ];

  // Navigasi untuk halaman notifikasi, inbox, dan halaman lain yang akan diarahkan dari bottom bar
  void goToNotifications() {
    // Logika untuk navigasi ke halaman notifikasi
    // Contoh: Get.to(NotificationsPage());
  }

  void goToInbox() {
    // Logika untuk navigasi ke halaman inbox
    // Contoh: Get.to(InboxPage());
  }

  void goToSearch() {
    // Logika untuk navigasi ke halaman search
    // Contoh: Get.to(SearchPage());
  }

  void goToInformation() {
    // Logika untuk navigasi ke halaman informasi
    // Contoh: Get.to(InformationPage());
  }

  void goToCart() {
    // Logika untuk navigasi ke halaman cart
    // Contoh: Get.to(CartPage());
  }

  void goToProfile() {
    // Logika untuk navigasi ke halaman profil
    // Contoh: Get.to(ProfilePage());
  }
}
