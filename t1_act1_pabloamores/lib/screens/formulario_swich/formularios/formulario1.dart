import 'package:flutter/material.dart';

class Formulario1 extends StatefulWidget {
  const Formulario1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Formulario1State createState() => _Formulario1State();
}

class _Formulario1State extends State<Formulario1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  bool _tieneHijos = false;
  final List<TextEditingController> _edadesHijosControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre completo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'El nombre solo puede contener letras y espacios';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _correoController,
                decoration:
                    const InputDecoration(labelText: 'Correo electrónico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor ingrese un correo válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su teléfono';
                  }
                  if (!RegExp(r'^\+?\d{9,15}$').hasMatch(value)) {
                    return 'Por favor ingrese un teléfono válido';
                  }
                  return null;
                },
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _tieneHijos,
                    onChanged: (bool? value) {
                      setState(() {
                        _tieneHijos = value ?? false;
                      });
                    },
                  ),
                  const Text('¿Tiene hijos?'),
                ],
              ),
              if (_tieneHijos) ...[
                const SizedBox(height: 10),
                const Text('Edad de los hijos (máximo 3):'),
                _buildEdadHijoField(0),
                _buildEdadHijoField(1),
                _buildEdadHijoField(2),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (_tieneHijos &&
                        _edadesHijosControllers
                            .every((controller) => controller.text.isEmpty)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Por favor ingrese la edad de al menos un hijo')),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Formulario enviado')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEdadHijoField(int index) {
    return Visibility(
      visible: index == 0 || _tieneHijos,
      child: TextFormField(
        controller: _edadesHijosControllers[index],
        decoration: InputDecoration(
          labelText: 'Edad del hijo ${index + 1}',
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            final edad = int.tryParse(value);
            if (edad == null || edad <= 0) {
              return 'Por favor ingrese una edad válida';
            }
          }
          return null;
        },
      ),
    );
  }
}
