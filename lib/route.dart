import 'package:flutter/material.dart';
import 'package:last_exam/utils/constants.dart';
import 'package:last_exam/views/add_card_page.dart/add_card_page.dart';
import 'package:last_exam/views/notifications_page/notifications_page.dart';
import 'package:last_exam/views/payment_page.dart/payment_page.dart';
import 'package:last_exam/views/splash_page.dart';
import 'package:last_exam/views/tabbox/cards_page/cards_page.dart';
import 'package:last_exam/views/tabbox/home_page/home_page.dart';
import 'package:last_exam/views/tabbox/settings_page/settings_page.dart';
import 'package:last_exam/views/tabbox/tab_box.dart';
import 'package:last_exam/views/update_card_page.dart/update_card_page.dart';

class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case noInternetRoute:
      //   return navigateTo(NoInternetScreen(voidCallback: settings.arguments as VoidCallback));
      case splashPage:
        return navigateTo(const SplashPage());
      case tabBox:
        return navigateTo(const TabBox());
      case homePage:
        return navigateTo(HomePage());
      case updateCardPage:
        final args = settings.arguments as Map<String, dynamic>;
        return navigateTo(UpdateCardPage(
          cardModel: args['cardModel'],
        ));
      case addCardPage:
        return navigateTo(const AddCardPage());
      case paymentPage:
        return navigateTo(PaymentPage());
      case cardsPage:
        return navigateTo(const CardsPage());
      case notificationsPage:
        return navigateTo(const NotificationsPage());
      case settigsPage:
        return navigateTo(const SettingsPage());
      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
      builder: (context) => widget,
    );
