import 'package:flutter/material.dart';
import 'package:wheels_app/CreateCupoScreen.dart';
import 'package:wheels_app/TravelHistoryScreen.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Container(
                              width: 159,
                              height: 47,
                              decoration: BoxDecoration(
                                color: Color(0xffafafaf),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "Lugares disponibles",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
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
                    //Texto Principal
                    Text(
                      '¿Qué deseas hacer?',
                      style: TextStyle(
                        color: const Color(0xFF2E2E2E),
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //Subtitulo
                    Text(
                      'Busca o crea tu cupo en Wheels hoy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF888888),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(33),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 156,
                            child: Text(
                              'Si buscar ir con otras personas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xCC888888),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.08,
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 146,
                            child: Text(
                              'Si quieres facilitar ir a algún lugar ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xCC888888),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.08,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //OPCIONES
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          //BUSCAR
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4ECDC4),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 60),
                                    Image.asset("BuscarViaje.png"),
                                    const SizedBox(height: 80),
                                    Container(
                                      height: 71.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0x3f1d1d1d),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "BUSCAR",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          //CREAR
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF2C3E50),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 60),
                                    Image.asset("CrearViaje.png"),
                                    const SizedBox(height: 80),
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navegación a CreateCupoScreen
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      const CreateCupoScreen(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 71.5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            color: Color(0x661d1d1d),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "CREAR",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //AYUDA
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C2C2E),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Ayuda',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.question_mark,
                                  size: 15,
                                  color: Color(0xFF2C2C2E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Navigation Bar
            Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.white),
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
            )
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

}
