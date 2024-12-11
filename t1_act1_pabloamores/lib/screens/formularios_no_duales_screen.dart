import 'package:flutter/material.dart';
import 'package:t1_act1_pabloamores/screens/screens.dart';

class FormulariosNoDual extends StatefulWidget {
  const FormulariosNoDual({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormulariosNoDualState createState() => _FormulariosNoDualState();
}

class _FormulariosNoDualState extends State<FormulariosNoDual> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _nombre = '';
  // ignore: unused_field
  String _apellidos = '';
  // ignore: unused_field
  String _email = '';
  // ignore: unused_field
  String _password = '';
  DateTime? _fechaNacimiento;
  String _opcionSeleccionada = 'Opción 1';
  bool _switchActivado = false;
  bool _checkboxValor = false;
  double _edad = 18;

  // Adivina el número
  final _numeroController = TextEditingController();
  int _numeroCorrecto = 42; // Número que hay que adivinar
  String _mensajeAdivinanza = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario Personalizado')),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Formulario existente
              _crearCampoTexto(
                label: 'Nombre',
                hint: 'Introduce tu nombre',
                onChanged: (valor) => _nombre = valor,
                validator: (valor) => valor!.isEmpty ? 'Campo requerido' : null,
                textCapitalization: TextCapitalization.words,
              ),
              _crearCampoTexto(
                label: 'Apellidos',
                hint: 'Introduce tus apellidos',
                onChanged: (valor) => _apellidos = valor,
                validator: (valor) => valor!.isEmpty ? 'Campo requerido' : null,
                textCapitalization: TextCapitalization.words,
              ),
              _crearCampoTexto(
                label: 'Email',
                hint: 'correo@dominio.com',
                onChanged: (valor) => _email = valor,
                validator: (valor) {
                  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (valor!.isEmpty) {
                    return 'Campo requerido';
                  } else if (!regex.hasMatch(valor)) {
                    return 'Introduce un email válido';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              _crearCampoTexto(
                label: 'Contraseña',
                hint: 'Introduce tu contraseña',
                onChanged: (valor) => _password = valor,
                validator: (valor) => valor!.isEmpty ? 'Campo requerido' : null,
                obscureText: true,
              ),
              _crearCampoFecha(context),
              _crearDropdown(),
              _crearCheckbox(),
              _crearSwitch(),
              _crearSlider(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Formulario enviado')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 20),
              // Formulario para adivinar el número
              _crearCampoNumero(),
              // Botón para actualizar el número
              ElevatedButton(
                onPressed: _actualizarNumero,
                child: const Text('Actualizar número'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Formulario de adivinar el número
  Widget _crearCampoNumero() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Adivina el número entre 1 y 100:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: _numeroController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Número',
              hintText: 'Introduce un número',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (valor) {
              setState(() {
                _mensajeAdivinanza = ''; // Reset mensaje al escribir
              });
            },
            validator: (valor) {
              // No es obligatorio, solo validamos si se ingresa un número
              if (valor!.isNotEmpty && int.tryParse(valor) == null) {
                return 'Por favor, ingresa un número válido.';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _validarNumero,
            child: const Text('Validar número'),
          ),
          if (_mensajeAdivinanza.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _mensajeAdivinanza,
                style: TextStyle(
                  color: _mensajeAdivinanza.contains('¡Correcto!')
                      ? Colors.green
                      : Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _validarNumero() {
    final numeroIngresado = int.tryParse(_numeroController.text);
    if (numeroIngresado == null) {
      setState(() {
        _mensajeAdivinanza = 'Por favor, ingresa un número válido.';
      });
    } else if (numeroIngresado < _numeroCorrecto) {
      setState(() {
        _mensajeAdivinanza = 'El número es mayor. ¡Inténtalo de nuevo!';
      });
    } else if (numeroIngresado > _numeroCorrecto) {
      setState(() {
        _mensajeAdivinanza = 'El número es menor. ¡Inténtalo de nuevo!';
      });
    } else {
      setState(() {
        _mensajeAdivinanza = '¡Correcto! Has adivinado el número.';
        _mostrarDialogoGanador();
      });
    }
  }

  // Mostrar un diálogo cuando el número es correcto
  void _mostrarDialogoGanador() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('¡Felicidades!'),
          content: const Text('Has adivinado el número correctamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _numeroController.clear();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  // Función para actualizar el número aleatorio
  void _actualizarNumero() {
    setState(() {
      _numeroCorrecto =
          (1 + (100 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000))
              .toInt();
      _mensajeAdivinanza = 'Número actualizado.';
    });
  }

  // Métodos del formulario existente (campo de texto, fecha, dropdown, etc.)
  Widget _crearCampoTexto({
    required String label,
    required String hint,
    required Function(String) onChanged,
    String? Function(String?)? validator,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        textCapitalization: textCapitalization,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _crearCampoFecha(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () async {
          final fechaSeleccionada = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          setState(() {
            _fechaNacimiento = fechaSeleccionada;
          });
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Fecha de nacimiento',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            _fechaNacimiento == null
                ? 'Selecciona tu fecha'
                : _fechaNacimiento!.toLocal().toString().split(' ')[0],
          ),
        ),
      ),
    );
  }

  Widget _crearDropdown() {
    return DropdownButtonFormField<String>(
      value: _opcionSeleccionada,
      onChanged: (valor) => setState(() => _opcionSeleccionada = valor!),
      items: ['Opción 1', 'Opción 2', 'Opción 3']
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      decoration: InputDecoration(
        labelText: 'Opciones',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: const Text('¿Aceptas los términos?'),
      value: _checkboxValor,
      onChanged: (valor) => setState(() => _checkboxValor = valor!),
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: const Text('Activar notificaciones'),
      value: _switchActivado,
      onChanged: (valor) => setState(() => _switchActivado = valor),
    );
  }

  Widget _crearSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Edad: ${_edad.toInt()} años'),
        Slider(
          value: _edad,
          min: 18,
          max: 99,
          divisions: 81,
          label: '${_edad.toInt()}',
          onChanged: (valor) => setState(() => _edad = valor),
        ),
      ],
    );
  }
}
