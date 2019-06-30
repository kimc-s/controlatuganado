import 'package:flutter/material.dart';

class AnimalesPage extends StatefulWidget {
  @override
  _AnimalesPageState createState() => _AnimalesPageState();
}

class _AnimalesPageState extends State<AnimalesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ANIMALES'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearAnimal1(context),
          Divider(),
          _crearAnimal2(context),
          Divider(),
          _crearAnimal3(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'datos');
        },
      ),
    );
  }

  Widget _crearAnimal1(BuildContext context) {

    /*return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre del animal',
        labelText: 'Nombre',
        icon: Icon(Icons.explore),
      ),
      onChanged: (valor) => setState(() {
        _nombre = valor;
      }),
    );*/
    return ListTile(
      title: Text('Animal 1'),
      onTap: () {
        Navigator.pushNamed(context, 'datos');
      }
    );

  }

  Widget _crearAnimal2(BuildContext context) {

    /*return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre del animal',
        labelText: 'Nombre',
        icon: Icon(Icons.explore),
      ),
      onChanged: (valor) => setState(() {
        _nombre = valor;
      }),
    );*/
    return ListTile(
      title: Text('Animal 2'),
      onTap: () {
        Navigator.pushNamed(context, 'datos');
      }
    );

  }

    Widget _crearAnimal3(BuildContext context) {

    /*return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre del animal',
        labelText: 'Nombre',
        icon: Icon(Icons.explore),
      ),
      onChanged: (valor) => setState(() {
        _nombre = valor;
      }),
    );*/
    return ListTile(
      title: Text('Animal 3'),
      onTap: () {
        Navigator.pushNamed(context, 'datos');
      }
    );

  }

}