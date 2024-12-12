import 'package:flutter/material.dart';
import 'package:t1_act1_pabloamores/screens/screens.dart';

class FormularioConSwitch extends StatefulWidget {
  const FormularioConSwitch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormularioConSwitchState createState() => _FormularioConSwitchState();
}

class _FormularioConSwitchState extends State<FormularioConSwitch> {
  bool _switchActivado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Formulario con Switch')),
      drawer: const MyDrawer(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Switch(
                value: _switchActivado,
                onChanged: (bool valor) {
                  setState(() {
                    _switchActivado = valor;
                  });
                },
              ),
              _switchActivado ? const Formulario2() : const Formulario1(),
            ],
          ),
        ),
      ),
    );
  }
}
