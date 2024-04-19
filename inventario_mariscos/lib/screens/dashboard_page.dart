import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<dynamic> _ventasDia = []; // Definición de _ventasDia

  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener datos de ventas por día al cargar la página
    obtenerVentasDia();
  }

  Future<void> obtenerVentasDia() async {
    try {
      // Obtener datos de ventas por día desde tu backend
      var response = await http.get(Uri.parse('http://localhost:3001/api/ventas/dia'));
      if (response.statusCode == 200) {
        setState(() {
          _ventasDia = json.decode(response.body);
        });
      } else {
        throw Exception('Error al obtener ventas por día');
      }
    } catch (error) {
      print('Error al obtener ventas por día: $error');
    }
  }

  // Método para construir el gráfico de líneas
  Widget _buildLineChart(List<dynamic> data) {
    // Corregir la declaración de la variable seriesList
    List<charts.Series<dynamic, num>> seriesList = [
      charts.Series<dynamic, num>(
        id: 'Ventas',
        domainFn: (dynamic sales, _) => sales['fecha'],
        measureFn: (dynamic sales, _) => sales['monto'],
        data: _ventasDia,
      ),
    ];



    return charts.LineChart(
      seriesList,
      animate: true,
      defaultRenderer: charts.LineRendererConfig(includePoints: true),
      behaviors: [
        charts.ChartTitle('Fecha', behaviorPosition: charts.BehaviorPosition.bottom),
        charts.ChartTitle('Monto', behaviorPosition: charts.BehaviorPosition.start),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Gráfico de ventas por día'),
              SizedBox(height: 10),
              Container(
                height: 300,
                child: _buildLineChart(_ventasDia), // Usar _ventasDia en el gráfico
              ),
            ],
          ),
        ),
      ),
    );
  }
}
