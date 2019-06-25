import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _fechaNacimiento = '';
  String _fechaParto = '';
  String _opcionSeleccionada = 'Elegir raza';

  List<String> _razas = ['Elegir raza','Holstein','Brown Swiss'];

  TextEditingController _inputFieldDateController1 =  new TextEditingController();
  TextEditingController _inputFieldDateController2 =  new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animales'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearFechaN(context),
          Divider(),
          _crearFechaP(context),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Nombre de la vaca',
        labelText: 'Nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) => setState(() {
        _nombre = valor;
      })
    );

  }

  Widget _crearFechaN(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.lock),
      ),
      onTap: () {

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate1(context);

      },
    );

  }

  Widget _crearFechaP(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController2,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de parto',
        labelText: 'Fecha de parto',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.lock),
      ),
      onTap: () {

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate2(context);

      },
    );

  }

  _selectDate1(BuildContext context) async {
    DateTime picked1 = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1993),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES'),
    );

    if (picked1 != null) {
      setState(() {
        _fechaNacimiento = picked1.toString();
        _inputFieldDateController1.text = _fechaNacimiento;
      });
    }

  }

  _selectDate2(BuildContext context) async {
    DateTime picked2 = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1993),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES'),
    );

    if (picked2 != null) {
      setState(() {
        _fechaParto = picked2.toString();
        _inputFieldDateController2.text = _fechaParto;
      });
    }

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    
    List<DropdownMenuItem<String>> lista = new List();

    _razas.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;

  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );

  }

  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Raza: $_opcionSeleccionada'),
    );

  }

}