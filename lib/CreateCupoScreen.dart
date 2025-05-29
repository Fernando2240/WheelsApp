import 'package:flutter/material.dart';
import 'package:wheels_app/TravelHistoryScreen.dart';

class CreateCupoScreen extends StatefulWidget {
  const CreateCupoScreen({Key? key}) : super(key: key);

  @override
  State<CreateCupoScreen> createState() => _CreateCupoScreenState();
}

class _CreateCupoScreenState extends State<CreateCupoScreen> {
  String selectedVehicle = 'auto';
  int numerosCupos = 1;
  String selectedRecogida = 'Cañaveral GC';
  String selectedDestino = 'Uis';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Título
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Crear ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF2C2C2E),
                        ),
                      ),
                      TextSpan(
                        text: 'cupo',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C2C2E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Contenido scrolleable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Selección de vehículo
                    const Text(
                      'Selecciona el tipo de vehículo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C2C2E),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildVehicleOption('moto', Icons.motorcycle, 'Moto'),
                        _buildVehicleOption('auto', Icons.directions_car, 'Auto'),
                        _buildVehicleOption('bus', Icons.directions_bus, 'Bus'),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // Subtítulo vehículos
                    const Center(
                      child: Text(
                        'Moto, carro o APPs de movilidad',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Número de cupos
                    const Text(
                      'Número de cupos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C2C2E),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (numerosCupos > 1) {
                                  setState(() {
                                    numerosCupos--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove, color: Colors.grey),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    numerosCupos.toString(),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2C2C2E),
                                    ),
                                  ),
                                  const Text(
                                    'cupos',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  numerosCupos++;
                                });
                              },
                              icon: const Icon(Icons.add, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Fecha y hora
                    const Text(
                      'Fecha y hora',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C2C2E),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () => _selectDateTime(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Jun 10, 2024 | 6:00 p.m.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.calendar_today,
                              color: Colors.grey[400],
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Selecciona recogida y destino
                    const Text(
                      'Selecciona la recogida y el destino',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C2C2E),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Recogida
                    const Text(
                      'Recogida',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C2C2E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF4ECDC4), width: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedRecogida,
                          isExpanded: true,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2C2C2E),
                          ),
                          items: ['Cañaveral GC', 'Centro', 'Norte', 'Sur']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedRecogida = newValue!;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Destino
                    Row(
                      children: [
                        const Text(
                          'Destino',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2C2C2E),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFF4ECDC4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.swap_vert,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedDestino,
                          isExpanded: true,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2C2C2E),
                          ),
                          items: ['Uis', 'Centro', 'Norte', 'Sur']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedDestino = newValue!;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Botón crear cupo
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Acción crear cupo
                          _showSuccessDialog();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C3E50),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Crear cupo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem(Icons.home, true, () {
                    // Estás en Home, no haces nada
                  }),
                  _buildBottomNavItem(Icons.access_time, false, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TravelHistoryScreen(),
                      ),
                    );
                  }),
                  _buildBottomNavItem(Icons.notifications_outlined, false, () {
                    // Puedes agregar navegación a notificaciones si deseas
                  }),
                  _buildBottomNavItem(Icons.person_outline, false, () {
                    // Navegar a perfil si deseas
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleOption(String type, IconData icon, String label) {
    bool isSelected = selectedVehicle == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedVehicle = type;
        });
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF4ECDC4) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? const Color(0xFF4ECDC4) : Colors.grey[600],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF4ECDC4) : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Icon(
      icon,
      size: 28,
      color: isSelected ? const Color(0xFF4ECDC4) : Colors.grey,
    ),
  );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = pickedDate;
          selectedTime = pickedTime;
        });
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Cupo creado!'),
          content: const Text('Tu cupo ha sido creado exitosamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Regresar a la pantalla anterior
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}