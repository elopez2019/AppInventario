import 'package:flutter/material.dart';
import 'package:inventario_mariscos_app/screens/combos_page.dart';
import 'package:inventario_mariscos_app/screens/dashboard_page.dart';
import 'package:inventario_mariscos_app/screens/products_page.dart';
import 'package:inventario_mariscos_app/screens/sales_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27ABCB), // Color hexadecimal
        title: Text(
          '',
          style: TextStyle(
            color: Colors.white, // Texto en color blanco
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: Text(
              'Inicio',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/sales');
            },
            child: Text(
              'Ventas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
            child: Text(
              'Dashboard',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
            child: Text(
              'Productos',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/combos');
            },
            child: Text(
              'Combos',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20), // Espacio entre la imagen y el texto
            Text(
              'Inventario Mariscos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
