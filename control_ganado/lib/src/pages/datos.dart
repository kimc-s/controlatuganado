import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  String _nombre = '';
  String _selectedRaza = 'Seleccionar';
  String _fechaN = '';
  String _fechaP = '';
  String _selectedMes = 'Mes';
  String _selectedYear = 'Año';

  List<String> _razas = ['Seleccionar', 'Raza 1', 'Raza 2', 'Raza 3'];
  List<String> _mes = ['Mes', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Setiembre', 'Octubre', 'Noviembre', 'Diciembre'];
  List<String> _year = ['Año', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019'];

  TextEditingController _inputController1 = new TextEditingController();
  TextEditingController _inputController2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos del animal'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _ingresarNombre(),
          Divider(),
          _ingresarRaza(),
          Divider(),
          _ingresarFechaN(context),
          Divider(),
          _ingresarFechaP(context),
          Divider(),
          _ingresarLeche(),
        ],
      ),
    );
  }

  Widget _ingresarNombre() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) => setState(() {
        _nombre = valor;
      })
    );

  }

  List<DropdownMenuItem<String>> getOpcionesRazas() {
    
    List<DropdownMenuItem<String>> lista = new List();

    _razas.forEach((raza) {
      lista.add(DropdownMenuItem(
        child: Text(raza),
        value: raza,
      ));
    });
    return lista;

  }

  List<DropdownMenuItem<String>> getOpcionesMes() {
    
    List<DropdownMenuItem<String>> lista = new List();

    _mes.forEach((mes) {
      lista.add(DropdownMenuItem(
        child: Text(mes),
        value: mes,
      ));
    });
    return lista;

  }

  List<DropdownMenuItem<String>> getOpcionesYear() {
    
    List<DropdownMenuItem<String>> lista = new List();

    _year.forEach((year) {
      lista.add(DropdownMenuItem(
        child: Text(year),
        value: year,
      ));
    });
    return lista;

  }

  Widget _ingresarRaza() {

    return Row(
      children: <Widget>[
        Text('Raza: '),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _selectedRaza,
            items: getOpcionesRazas(),
            onChanged: (opt) {
              setState(() {
                _selectedRaza = opt;
              });
            },
          ),
        ),
      ],
    );

  }

  Widget _ingresarFechaN(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputController1,
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

  _selectDate1(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1993),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES'),
    );

    if (picked != null) {
      setState(() {
        _fechaN = picked.toString();
        _inputController1.text = _fechaN;
      });
    }

  }

  Widget _ingresarFechaP(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputController2,
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

  _selectDate2(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2015),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES'),
    );

    if (picked != null) {
      setState(() {
        _fechaP = picked.toString();
        _inputController2.text = _fechaP;
      });
    }

  }

  Widget _ingresarLeche() {

    return Row(
      children: <Widget>[
        Text('Registro leche: '),
        Expanded(
          child: DropdownButton(
            value: _selectedMes,
            items: getOpcionesMes(),
            onChanged: (opt) {
              setState(() {
                _selectedMes = opt;
              });
            },
          ),
        ),
        Expanded(
          child: DropdownButton(
            value: _selectedYear,
            items: getOpcionesYear(),
            onChanged: (opt) {
              setState(() {
                _selectedYear = opt;
              });
            },
          ),
        ),
      ],
    );

  }

}