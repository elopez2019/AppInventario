import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CombosPage extends StatefulWidget {
  @override
  _CombosPageState createState() => _CombosPageState();
}

class _CombosPageState extends State<CombosPage> {
  List<dynamic> _combos = [];

  @override
  void initState() {
    super.initState();
    getCombos();
  }

  Future<void> getCombos() async {
    try {
      var response = await http.get(Uri.parse('http://localhost:3001/combos'));
      if (response.statusCode == 200) {
        List<dynamic> combos = json.decode(response.body);
        setState(() {
          _combos = combos;
        });
      } else {
        throw Exception('Error al cargar los combos');
      }
    } catch (error) {
      print('Error al obtener la lista de combos: $error');
    }
  }

  Future<void> handleDelete(int id) async {
    try {
      var response = await http.delete(Uri.parse('http://localhost:3001/combos/$id'));
      if (response.statusCode == 200) {
        await getCombos();
        print('Combo eliminado: $id');
      } else {
        throw Exception('Error al eliminar el combo');
      }
    } catch (error) {
      print('Error al eliminar el combo: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Combos'),
      ),
      body: ListView.builder(
        itemCount: _combos.length,
        itemBuilder: (context, index) {
          final combo = _combos[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(combo['nombre_combo']),
              subtitle: Text('\$${combo['precio_combo']}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Eliminar Combo'),
                        content: Text('¿Estás seguro de que quieres eliminar este combo?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              handleDelete(combo['id_combo']);
                              Navigator.pop(context, 'OK');
                            },
                            child: Text('Eliminar'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
