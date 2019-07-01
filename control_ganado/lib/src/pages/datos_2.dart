import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DataPage2 extends StatefulWidget {
  @override
  _DataPage2State createState() => _DataPage2State();
}

class _DataPage2State extends State<DataPage2> {

  String _nombre = 'Animal 2';
  String _selectedRaza = 'Raza 2';
  String _fechaN = '1995-07-23';
  String _fechaP = '2011-09-01';
  String _selectedYear = '2010';

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

  double _X0 = 1;
  double _X1 = 3;
  double _X2 = 5;
  double _X3 = 7;
  double _X4 = 9;

  double _Y0 = 2;
  double _Y1 = 4;
  double _Y2 = 6;
  double _Y3 = 8;
  double _Y4 = 10;
  
  double _H0;
  double _H1;
  double _H2;
  double _H3;
  double _H4;
  
  double _A0;
  double _A1;
  double _A2;
  double _A3;
  double _A4;

  double _L0;
  double _L1;
  double _L2;
  double _L3;
  double _L4;

  double _U0;
  double _U1;
  double _U2;
  double _U3;
  double _U4;

  double _Z0;
  double _Z1;
  double _Z2;
  double _Z3;
  double _Z4;

  double _C0;
  double _C1;
  double _C2;
  double _C3;
  double _C4;

  double _B0;
  double _B1;
  double _B2;
  double _B3;
  double _B4;

  double _D0;
  double _D1;
  double _D2;
  double _D3;
  double _D4;

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
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      controller: _inputController3,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: '$_nombre',
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
                  hintText: '$_X0',
                ),
                onChanged: (valor) => setState(() {
                  _X0 = double.parse(valor);
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
                  hintText: '$_Y0',
                ),
                onChanged: (valor) => setState(() {
                  _Y0 = double.parse(valor);
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
                  hintText: '$_X1',
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
                controller: _conY2,
                decoration: InputDecoration(
                  hintText: '$_Y1',
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
                controller: _conX3,
                decoration: InputDecoration(
                  hintText: '$_X2',
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
                controller: _conY3,
                decoration: InputDecoration(
                  hintText: '$_Y2',
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
                controller: _conX4,
                decoration: InputDecoration(
                  hintText: '$_X3',
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
                controller: _conY4,
                decoration: InputDecoration(
                  hintText: '$_Y3',
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
                controller: _conX5,
                decoration: InputDecoration(
                  hintText: '$_X4',
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
                controller: _conY5,
                decoration: InputDecoration(
                  hintText: '$_Y4',
                ),
                onChanged: (valor) => setState(() {
                  _Y4 = double.parse(valor);
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
        Text(_ecuacionSpline()),
        SizedBox(height: 20.0),
        Text('Matriz de coeficientes', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        SizedBox(height: 10.0),
        Center(
          child: Text(_matrizCoeficientes(), style: TextStyle(fontSize: 16)),
        ),
      ],
    );

  }

  String _ecuacionSpline() {

    String resultado;

    //Paso 1
    _H0 = _X1-_X0;
    _H1 = _X2-_X1;
    _H2 = _X3-_X2;
    _H3 = _X4-_X3;

    //Paso 2
    _A1 = ((3/_H1)*(_Y2-_Y1)-(3/_H0)*(_Y1-_Y0));
    _A2 = ((3/_H2)*(_Y3-_Y2)-(3/_H1)*(_Y2-_Y1));
    _A3 = ((3/_H3)*(_Y4-_Y3)-(3/_H2)*(_Y3-_Y2));

    //Paso 3
    _L0 = 1;
    _U0 = 0;
    _Z0 = 0;

    //Paso 4
    _L1 = ((2*(_X2-_X0)) - (_H0 * _U0));
    _U1 = _H1/_L1;
    _Z1 = ((_A1 - (_H0*_Z0))/_L1);

    _L2 = ((2*(_X3-_X1)) - (_H1 * _U1));
    _U2 = _H2/_L2;
    _Z2 = ((_A2 - (_H1*_Z1))/_L2);

    _L3 = ((2*(_X4-_X2)) - (_H2 * _U2));
    _U3 = _H3/_L3;
    _Z3 = ((_A3 - (_H2*_Z2))/_L3);

    //Paso 5
    _L4 = 1;
    _Z4 = 0;
    _C4 = 0;

    //Paso 6
    _C3 = _Z3 - (_U3*_C4);
    _B3 = (((_Y4-_Y3)/_H3) - ((_H3*(_C4+2*_C3))/3));
    _D3 = ((_C4 - _C3)/(3*_H3));

    _C2 = _Z2 - (_U2*_C3);
    _B2 = (((_Y3-_Y2)/_H2) - ((_H2*(_C3+2*_C2))/3));
    _D2 = ((_C3 - _C2)/(3*_H2));

    _C1 = _Z1 - (_U1*_C2);
    _B1 = (((_Y2-_Y1)/_H1) - ((_H1*(_C2+2*_C1))/3));
    _D1 = ((_C2 - _C1)/(3*_H1));

    _C0 = _Z0 - (_U0*_C1);
    _B0 = (((_Y1-_Y0)/_H0) - ((_H0*(_C1+2*_C0))/3));
    _D0 = ((_C1 - _C0)/(3*_H0));

    String y0 = _Y0.toStringAsFixed(2);
    String y1 = _Y1.toStringAsFixed(2);
    String y2 = _Y2.toStringAsFixed(2);
    String y3 = _Y3.toStringAsFixed(2);
    
    String b0 = _B0.toStringAsFixed(2);
    String b1 = _B1.toStringAsFixed(2);
    String b2 = _B2.toStringAsFixed(2);
    String b3 = _B3.toStringAsFixed(2);

    String x0 = _X0.toStringAsFixed(2);
    String x1 = _X1.toStringAsFixed(2);
    String x2 = _X2.toStringAsFixed(2);
    String x3 = _X3.toStringAsFixed(2);

    String c0 = _C0.toStringAsFixed(2);
    String c1 = _C1.toStringAsFixed(2);
    String c2 = _C2.toStringAsFixed(2);
    String c3 = _C3.toStringAsFixed(2);

    String d0 = _D0.toStringAsFixed(2);
    String d1 = _D1.toStringAsFixed(2);
    String d2 = _D2.toStringAsFixed(2);
    String d3 = _D3.toStringAsFixed(2);

    resultado = 'Ecuación 1 = $y0 + $b0 * (x - $x0) + $c0 * (x - $x0)^2 + $d0(x - $x0)^3\n\nEcuación 2 = $y1 + $b1 * (x - $x1) + $c1 * (x - $x1)^2 + $d1(x - $x1)^3\n\nEcuación 3 = $y2 + $b2 * (x - $x2) + $c2 * (x - $x2)^2 + $d2(x - $x2)^3\n\nEcuación 4 = $y3 + $b3 * (x - $x3) + $c3 * (x - $x3)^2 + $d3(x - $x3)^3';

    return resultado;

  }

  String _matrizCoeficientes() {

    String resultado;

    String y0 = _Y0.toStringAsFixed(2);
    String y1 = _Y1.toStringAsFixed(2); 
    String y2 = _Y2.toStringAsFixed(2); 
    String y3 = _Y3.toStringAsFixed(2); 
    String y4 = _Y4.toStringAsFixed(2);

    String b0 = _B0.toStringAsFixed(2);
    String b1 = _B1.toStringAsFixed(2); 
    String b2 = _B2.toStringAsFixed(2); 
    String b3 = _B3.toStringAsFixed(2); 
    String b4 = '4e+33';

    String c0 = _C0.toStringAsFixed(2);
    String c1 = _C1.toStringAsFixed(2); 
    String c2 = _C2.toStringAsFixed(2); 
    String c3 = _C3.toStringAsFixed(2); 
    String c4 = _C4.toStringAsFixed(2);

    String d0 = _D0.toStringAsFixed(2);
    String d1 = _D1.toStringAsFixed(2); 
    String d2 = _D2.toStringAsFixed(2); 
    String d3 = _D3.toStringAsFixed(2); 
    String d4 = '4e+33';

    String x0 = _X0.toStringAsFixed(2);
    String x1 = _X1.toStringAsFixed(2); 
    String x2 = _X2.toStringAsFixed(2); 
    String x3 = _X3.toStringAsFixed(2); 
    String x4 = _X4.toStringAsFixed(2);

    resultado = '$y0\t\t\t\t$y1\t\t\t\t$y2\t\t\t\t$y3\t\t\t\t$y4\n$b0\t\t\t\t$b1\t\t\t\t$b2\t\t\t\t$b3\t\t\t\t$b4\n$c0\t\t\t\t$c1\t\t\t\t$c2\t\t\t\t$c3\t\t\t\t$c4\n$d0\t\t\t\t$d1\t\t\t\t$d2\t\t\t\t$d3\t\t\t\t$d4\n$x0\t\t\t\t$x1\t\t\t\t$x2\t\t\t\t$x3\t\t\t\t$x4';

    return resultado;

  }

}