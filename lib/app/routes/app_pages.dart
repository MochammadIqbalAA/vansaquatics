import 'package:get/get.dart';

import '../modules/aboutus/bindings/aboutus_binding.dart';
import '../modules/aboutus/views/aboutus_view.dart';
import '../modules/account_settings/bindings/account_settings_binding.dart';
import '../modules/account_settings/views/account_settings_view.dart';
import '../modules/addfriend/bindings/addfriend_binding.dart';
import '../modules/addfriend/views/addfriend_view.dart';
import '../modules/cart_page/bindings/cart_page_binding.dart';
import '../modules/cart_page/views/cart_page_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/detail_item/bindings/detail_item_binding.dart';
import '../modules/detail_item/views/detail_item_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/faq/bindings/faq_binding.dart';
import '../modules/faq/views/faq_view.dart';
import '../modules/favorite_product/bindings/favorite_product_binding.dart';
import '../modules/favorite_product/views/favorite_product_view.dart';
import '../modules/friendlist/bindings/friendlist_binding.dart';
import '../modules/friendlist/views/friendlist_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_admin/bindings/home_admin_binding.dart';
import '../modules/home_admin/views/home_admin_view.dart';
import '../modules/inbox/bindings/inbox_binding.dart';
import '../modules/inbox/views/inbox_view.dart';
import '../modules/information/bindings/information_binding.dart';
import '../modules/information/views/information_view.dart';
import '../modules/myorder/bindings/myorder_binding.dart';
import '../modules/myorder/views/myorder_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/notification_detail/bindings/notification_detail_binding.dart';
import '../modules/notification_detail/views/notification_detail_view.dart';
import '../modules/notification_setting/bindings/notification_setting_binding.dart';
import '../modules/notification_setting/views/notification_setting_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/privacy/bindings/privacy_binding.dart';
import '../modules/privacy/views/privacy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/report_problem/bindings/report_problem_binding.dart';
import '../modules/report_problem/views/report_problem_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/waiting_for_payment/bindings/waiting_for_payment_binding.dart';
import '../modules/waiting_for_payment/views/waiting_for_payment_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_DETAIL,
      page: () => NotificationDetailView(),
      binding: NotificationDetailBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.INBOX,
      page: () => InboxView(),
      binding: InboxBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => InformationView(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_PROBLEM,
      page: () => ReportProblemsView(),
      binding: ReportProblemBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SETTING,
      page: () => NotificationSettingsView(),
      binding: NotificationSettingBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE_PRODUCT,
      page: () => FavoriteProductsView(),
      binding: FavoriteProductBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => AboutUsView(),
      binding: AboutusBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY,
      page: () => const PrivacySettingsView(),
      binding: PrivacyBinding(),
    ),
    GetPage(
      name: _Paths.MYORDER,
      page: () => MyOrderView(),
      binding: MyorderBinding(),
    ),
    GetPage(
      name: _Paths.ADDFRIEND,
      page: () => AddFriendView(),
      binding: AddfriendBinding(),
    ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => CartPage(),
      binding: CartPageBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.WAITING_FOR_PAYMENT,
      page: () => WaitingForPayment(),
      binding: WaitingForPaymentBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTINGS,
      page: () => AccountSettingsView(),
      binding: AccountSettingsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ITEM,
      page: () => DetailItemView(
        id: Get.arguments['id'],
        imageUrl: Get.arguments['imagePath'],
        name: Get.arguments['title'],
        price: Get.arguments['price'],
        description: Get.arguments['description'],
      ),
      binding: DetailItemBinding(),
    ),
    GetPage(
      name: _Paths.FRIENDLIST,
      page: () => FriendListView(),
      binding: FriendlistBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
  ];
}
