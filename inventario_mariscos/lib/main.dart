import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventario_mariscos_app/screens/combos_page.dart';
import 'package:inventario_mariscos_app/screens/dashboard_page.dart';
import 'package:inventario_mariscos_app/screens/home_page.dart';
import 'package:inventario_mariscos_app/screens/products_page.dart';
import 'package:inventario_mariscos_app/screens/sales_page.dart';

void main() {
  runApp(MyApp());
}

final navigationProvider = StateProvider((ref) => 'home');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Mi Aplicación',
        routes: {
          '/home': (context) => HomePage(),
          '/ventas': (context) => SalesPage(),
          '/dashboard': (context) => DashboardPage(),
          '/products': (context) => ProductsPage(),
          '/combos': (context) => CombosPage(),
        },
        home: Consumer(builder: (context, watch, _) {
          final currentPage = watch(navigationProvider).state;
          return _getPage(currentPage);
        }),
      ),
    );
  }

  Widget _getPage(String page) {
    switch (page) {
      case 'home':
        return HomePage();
      case 'ventas':
        return SalesPage();
      case 'dashboard':
        return DashboardPage();
      case 'products':
        return ProductsPage();
      case 'combos':
        return CombosPage();
      default:
        return Container();
    }
  }
}
