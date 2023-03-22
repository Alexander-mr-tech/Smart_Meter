import 'package:flutter/material.dart';
import 'package:sepsmm/Drawer/drawer.dart';
class ohm_law extends StatefulWidget {
  const ohm_law({super.key});

  @override
  State<ohm_law> createState() => _ohm_lawState();
}

// ignore: camel_case_types
class _ohm_lawState extends State<ohm_law> {
  final TextEditingController _voltageController = TextEditingController();
  final TextEditingController _currentController = TextEditingController();
  final TextEditingController _resistanceController = TextEditingController();

  double? _voltage;
  double? _current;
  double? _resistance;

  void _calculateOhmsLaw() {
    setState(() {
      if (_voltageController.text.isNotEmpty &&
          _currentController.text.isNotEmpty) {
        _voltage = double.parse(_voltageController.text);
        _current = double.parse(_currentController.text);
        _resistance = _voltage! / _current!;
        _resistanceController.text = _resistance!.toStringAsFixed(2);
      } else if (_voltageController.text.isNotEmpty &&
          _resistanceController.text.isNotEmpty) {
        _voltage = double.parse(_voltageController.text);
        _resistance = double.parse(_resistanceController.text);
        _current = _voltage! / _resistance!;
        _currentController.text = _current!.toStringAsFixed(2);
      } else if (_currentController.text.isNotEmpty &&
          _resistanceController.text.isNotEmpty) {
        _current = double.parse(_currentController.text);
        _resistance = double.parse(_resistanceController.text);
        _voltage = _current! * _resistance!;
        _voltageController.text = _voltage!.toStringAsFixed(2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ohm's Law"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Calculation",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: TextField(
                controller: _voltageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.accessibility),
                    prefixIconColor: Colors.indigoAccent,
                  labelText: 'Voltage (V)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: TextField(
                controller: _currentController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.accessibility),
                  prefixIconColor: Colors.indigoAccent,
                  labelText: 'Current (A)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                ),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(

                controller: _resistanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.accessibility),
                    prefixIconColor: Colors.indigoAccent,
                  labelText: 'Resistance (Ω)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _calculateOhmsLaw,
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                const Text("Voltage (V)",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                Text(_voltage.toString(),
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold)),
                const Text("Current (I)",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                Text(_current.toString(),
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold)),
                const Text("Resistance (Ω)",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                Text(_resistance.toString(),
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }
}

