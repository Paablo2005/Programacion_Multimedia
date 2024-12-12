import 'package:flutter/material.dart';

class Formulario2 extends StatefulWidget {
  const Formulario2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario2> {
  final TextEditingController _controladorFecha = TextEditingController();
  String _ciudadElegida = 'Sevilla';
  final List<String> _listaAficiones = [
    'Fútbol',
    'Leer',
    'Cine',
    'Viajar',
    'Bailar'
  ];
  final List<String> _aficionesSeleccionadas = [];
  String? _sexoSeleccionado = 'Prefiero no contestar';

  final List<String> _ciudadesDisponibles = [
    'Sevilla',
    'Málaga',
    'Córdoba',
    'Granada',
    'Jaén',
    'Cádiz',
    'Huelva',
    'Almería',
    'Cádiz'
  ];

  String _mensajeErrorFecha = '';
  String _mensajeErrorCiudad = '';
  String _mensajeErrorAficiones = '';
  String _mensajeErrorSexo = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorFecha,
              decoration: InputDecoration(
                labelText: 'Fecha',
                hintText: 'Selecciona una fecha',
                suffixIcon: const Icon(Icons.calendar_today),
                errorText:
                    _mensajeErrorFecha.isEmpty ? null : _mensajeErrorFecha,
              ),
              readOnly: true,
              onTap: () async {
                DateTime? fechaSeleccionada = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (fechaSeleccionada != null) {
                  setState(() {
                    _controladorFecha.text =
                        '${fechaSeleccionada.toLocal()}'.split(' ')[0];
                  });
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: _ciudadElegida,
              onChanged: (String? nuevaCiudad) {
                setState(() {
                  _ciudadElegida = nuevaCiudad!;
                });
              },
              items: _ciudadesDisponibles.map((String ciudad) {
                return DropdownMenuItem<String>(
                  value: ciudad,
                  child: Text(ciudad),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Ciudad de Andalucía',
                errorText:
                    _mensajeErrorCiudad.isEmpty ? null : _mensajeErrorCiudad,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Aficiones:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                ..._listaAficiones.map((aficion) {
                  return CheckboxListTile(
                    title: Text(aficion),
                    value: _aficionesSeleccionadas.contains(aficion),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _aficionesSeleccionadas.add(aficion);
                        } else {
                          _aficionesSeleccionadas.remove(aficion);
                        }
                      });
                    },
                  );
                }),
                if (_mensajeErrorAficiones.isNotEmpty)
                  Text(
                    _mensajeErrorAficiones,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Sexo:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                RadioListTile<String>(
                  title: const Text('Hombre'),
                  value: 'Hombre',
                  groupValue: _sexoSeleccionado,
                  onChanged: (String? valor) {
                    setState(() {
                      _sexoSeleccionado = valor;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Mujer'),
                  value: 'Mujer',
                  groupValue: _sexoSeleccionado,
                  onChanged: (String? valor) {
                    setState(() {
                      _sexoSeleccionado = valor;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Prefiero no contestar'),
                  value: 'Prefiero no contestar',
                  groupValue: _sexoSeleccionado,
                  onChanged: (String? valor) {
                    setState(() {
                      _sexoSeleccionado = valor;
                    });
                  },
                ),
                if (_mensajeErrorSexo.isNotEmpty)
                  Text(
                    _mensajeErrorSexo,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _enviarFormulario();
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }

  void _enviarFormulario() {
    setState(() {
      _mensajeErrorFecha = '';
      _mensajeErrorCiudad = '';
      _mensajeErrorAficiones = '';
      _mensajeErrorSexo = '';
    });

    bool formularioValido = true;

    if (_controladorFecha.text.isEmpty) {
      setState(() {
        _mensajeErrorFecha = 'Por favor, selecciona una fecha.';
      });
      formularioValido = false;
    }

    if (_ciudadElegida.isEmpty) {
      setState(() {
        _mensajeErrorCiudad = 'Por favor, selecciona una ciudad.';
      });
      formularioValido = false;
    }

    if (_aficionesSeleccionadas.isEmpty) {
      setState(() {
        _mensajeErrorAficiones = 'Debes seleccionar al menos una afición.';
      });
      formularioValido = false;
    }

    if (_sexoSeleccionado == null) {
      setState(() {
        _mensajeErrorSexo = 'Por favor, selecciona tu sexo.';
      });
      formularioValido = false;
    }

    if (formularioValido) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulario enviado con éxito')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }
}
