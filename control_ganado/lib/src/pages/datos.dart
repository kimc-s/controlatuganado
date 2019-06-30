import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DataPage1 extends StatefulWidget {
  @override
  _DataPage1State createState() => _DataPage1State();
}

class _DataPage1State extends State<DataPage1> {

  String _nombre = 'Animal 1';
  String _selectedRaza = 'Raza 1';
  String _fechaN = '1993-04-15';
  String _fechaP = '2009-08-06';
  String _selectedYear = '2000';

  List<String> _razas = ['Seleccionar', 'Raza 1', 'Raza 2', 'Raza 3'];
  List<String> _year = ['Año', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019'];

  TextEditingController _inputController1 = new TextEditingController();
  TextEditingController _inputController2 = new TextEditingController();
  TextEditingController _inputController3 = new TextEditingController();

  TextEditingController _conX1 = new TextEditingController();
  TextEditingController _conX2 = new TextEditingController();
  TextEditingController _conX3 = new TextEditingController();
  TextEditingController _conX4 = new TextEditingController();
  TextEditingController _conX5 = new TextEditingController();
  TextEditingController _conY1 = new TextEditingController();
  TextEditingController _conY2 = new TextEditingController();
  TextEditingController _conY3 = new TextEditingController();
  TextEditingController _conY4 = new TextEditingController();
  TextEditingController _conY5 = new TextEditingController();

  double _X1 = 4;
  double _X2 = 6;
  double _X3 = 8;
  double _X4 = 10;
  double _X5 = 12;
  double _Y1 = 5;
  double _Y2 = 7;
  double _Y3 = 9;
  double _Y4 = 11;
  double _Y5 = 13;
  double _H1;
  double _H2;
  double _H3;
  double _H4;
  double _H5;
  double _A1;
  double _A2;
  double _A3;
  double _A4;
  double _A5;

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
          Divider(),
          _ingresarDatos(),
          Divider(),
          _resultados(),
        ],
      ),
    );
  }

  Widget _ingresarNombre() {
    _inputController3.text = _nombre;
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      controller: _inputController3,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Ingrese el nombre',
        labelText: 'Nombre',
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
    _inputController1.text = _fechaN; 
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
        _fechaN = picked.toString().substring(0,10);
        _inputController1.text = _fechaN;
      });
    }

  }

  Widget _ingresarFechaP(BuildContext context) {
    _inputController2.text = _fechaP;
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
        _fechaP = picked.toString().substring(0,10);
        _inputController2.text = _fechaP;
      });
    }

  }

  Widget _ingresarLeche() {

    return Row(
      children: <Widget>[
        Text('Registro leche año: '),
        SizedBox(width: 20.0),
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

  Widget _ingresarDatos() {
    _conX1.text = _X1.toString();
    _conX2.text = _X2.toString();
    _conX3.text = _X3.toString();
    _conX4.text = _X4.toString();
    _conX5.text = _X5.toString();
    _conY1.text = _Y1.toString();
    _conY2.text = _Y2.toString();
    _conY3.text = _Y3.toString();
    _conY4.text = _Y4.toString();
    _conY5.text = _Y5.toString();
    return Column(
      children: <Widget>[

        Row(
          children: <Widget>[
            Text('Dias: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conX1,
                decoration: InputDecoration(
                  hintText: 'X1',
                ),
                onChanged: (valor) => setState(() {
                  _X1 = double.parse(valor);
                }),
              ),
            ),
            SizedBox(width: 10.0),
            Text('Cantidad: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conY1,
                decoration: InputDecoration(
                  hintText: 'Y1',
                ),
                onChanged: (valor) => setState(() {
                  _Y1 = double.parse(valor);
                }),
              ),
            ),
          ],
        ),

        SizedBox(height: 10.0),
        
        Row(
          children: <Widget>[
            Text('Dias: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conX2,
                decoration: InputDecoration(
                  hintText: 'X2',
                ),
                onChanged: (valor) => setState(() {
                  _X2 = double.parse(valor);
                }),
              ),
            ),
            SizedBox(width: 10.0),
            Text('Cantidad: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conY2,
                decoration: InputDecoration(
                  hintText: 'Y2',
                ),
                onChanged: (valor) => setState(() {
                  _Y2 = double.parse(valor);
                }),
              ),
            ),
          ],
        ),

        SizedBox(height: 10.0),
        
        Row(
          children: <Widget>[
            Text('Dias: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conX3,
                decoration: InputDecoration(
                  hintText: 'X3',
                ),
                onChanged: (valor) => setState(() {
                  _X3 = double.parse(valor);
                }),
              ),
            ),
            SizedBox(width: 10.0),
            Text('Cantidad: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conY3,
                decoration: InputDecoration(
                  hintText: 'Y3',
                ),
                onChanged: (valor) => setState(() {
                  _Y3 = double.parse(valor);
                }),
              ),
            ),
          ],
        ),

        SizedBox(height: 10.0),
        
        Row(
          children: <Widget>[
            Text('Dias: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conX4,
                decoration: InputDecoration(
                  hintText: 'X4',
                ),
                onChanged: (valor) => setState(() {
                  _X4 = double.parse(valor);
                }),
              ),
            ),
            SizedBox(width: 10.0),
            Text('Cantidad: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conY4,
                decoration: InputDecoration(
                  hintText: 'Y4',
                ),
                onChanged: (valor) => setState(() {
                  _Y4 = double.parse(valor);
                }),
              ),
            ),
          ],
        ),

        SizedBox(height: 10.0),
        
        Row(
          children: <Widget>[
            Text('Dias: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conX5,
                decoration: InputDecoration(
                  hintText: 'X5',
                ),
                onChanged: (valor) => setState(() {
                  _X5 = double.parse(valor);
                }),
              ),
            ),
            SizedBox(width: 10.0),
            Text('Cantidad: '),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: _conY5,
                decoration: InputDecoration(
                  hintText: 'Y5',
                ),
                onChanged: (valor) => setState(() {
                  _Y5 = double.parse(valor);
                }),
              ),
            ),
          ],
        ),

      ],
    );

  }

  Widget _resultados() {

    return Column(
      children: <Widget>[
        Text('Ecuaciones obtenidas mediante Spline', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        SizedBox(height: 10.0),
        Text('Ecuación 1: x^2+x+3\n\nEcuación 2: x^2+x+3\n\nEcuación 3: x^2+x+3\n\nEcuación 4: x^2+x+3'),
        SizedBox(height: 20.0),
        Text('Matriz de coeficientes', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        SizedBox(height: 10.0),
        Center(
          child: Text('3\t\t\t\t4\t\t\t\t5\t\t\t\t6\t\t\t\t7\n3\t\t\t\t4\t\t\t\t5\t\t\t\t6\t\t\t\t7\n3\t\t\t\t4\t\t\t\t5\t\t\t\t6\t\t\t\t7\n3\t\t\t\t4\t\t\t\t5\t\t\t\t6\t\t\t\t7\n3\t\t\t\t4\t\t\t\t5\t\t\t\t6\t\t\t\t7', style: TextStyle(fontSize: 17)),
        ),
      ],
    );

  }

  String _ecuacionSpline() {

    //Paso 1
    _H1 = _X2-_X1;
    _H2 = _X3-_X2;
    _H3 = _X4-_X3;
    _H4 = _X5-_X4;

    //Paso 2
    _A1 = ((3/_H2)*(_Y3-_Y2)-(3/_H1)*(_Y2));

  }

}