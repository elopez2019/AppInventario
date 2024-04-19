import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // Define los estados locales necesarios
  final TextEditingController _nombreProductoController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioPorLibraController = TextEditingController();
  final TextEditingController _cantidadEnExistenciaController = TextEditingController();

  List<Map<String, dynamic>> _products = [];
  int _editingProductId = -1; // Inicializa _editingProductId con -1
  bool _isClearingForm = false;

  @override
  void initState() {
    super.initState();
    // Llama a la función para obtener todos los productos al cargar el componente
    _getProducts();
  }

  @override
  void dispose() {
    // Limpia los controladores de texto cuando se elimina el widget
    _nombreProductoController.dispose();
    _descripcionController.dispose();
    _precioPorLibraController.dispose();
    _cantidadEnExistenciaController.dispose();
    super.dispose();
  }

  void _handleChange(String name, String value) {
    // Actualiza el estado local con los nuevos valores del formulario
    setState(() {
      switch (name) {
        case 'nombre_producto':
          _nombreProductoController.text = value;
          break;
        case 'descripcion':
          _descripcionController.text = value;
          break;
        case 'precio_por_libra':
          _precioPorLibraController.text = value;
          break;
        case 'cantidad_en_existencia':
          _cantidadEnExistenciaController.text = value;
          break;
      }
    });
  }

  void _handleSubmit() async {
    // Implementa la lógica para manejar la presentación del formulario
    // ...
  }

  void _handleEdit(int id) {
    // Implementa la lógica para manejar la edición de un producto
    // ...
  }

  void _getProducts() async {
    // Implementa la lógica para obtener todos los productos del backend
    // ...
  }

  void _handleDelete(int id) {
    // Implementa la lógica para manejar la eliminación de un producto
    // ...
  }

  void _handleClearForm() {
    // Implementa la lógica para limpiar el formulario
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registro de Nuevo Producto',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _nombreProductoController,
              onChanged: (value) => _handleChange('nombre_producto', value),
              decoration: InputDecoration(labelText: 'Nombre del Producto'),
            ),
            TextField(
              controller: _descripcionController,
              onChanged: (value) => _handleChange('descripcion', value),
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _precioPorLibraController,
              onChanged: (value) => _handleChange('precio_por_libra', value),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Precio por Libra'),
            ),
            TextField(
              controller: _cantidadEnExistenciaController,
              onChanged: (value) => _handleChange('cantidad_en_existencia', value),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cantidad en Existencia'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Registrar'),
            ),
            SizedBox(height: 40.0),
            Text(
              'Lista de Productos',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            // Implementa la lógica para mostrar la lista de productos
            // ...
          ],
        ),
      ),
    );
  }
}
