import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravelHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> travelData = [
    {
      'date': '19/03/24',
      'trips': [
        {
          'time': '7:30 AM',
          'route': 'Calle 200, Versalles > UIS',
          'plate': 'YHJ923',
          'price': '\$4,500',
          'vehicle': Icons.motorcycle,
        },
        {
          'time': '6:00 PM',
          'route': 'UIS > Cabecera',
          'plate': 'KLN243',
          'price': '\$2,500',
          'vehicle': Icons.motorcycle,
        },
      ],
    },
    {
      'date': '25/03/24',
      'trips': [
        {
          'time': '6:00 PM',
          'route': 'UIS',
          'plate': 'P00123',
          'price': '\$3,500',
          'vehicle': Icons.motorcycle,
        },
      ],
    },
    {
      'date': '05/04/24',
      'trips': [
        {
          'time': '10:00 AM',
          'route': 'Cañaveral CC',
          'plate': 'MNV327',
          'price': '\$2,500',
          'vehicle': Icons.directions_car,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(
              width: 363,
              height: 38,
              child: Text(
                'Historial de viajes',
                style: TextStyle(
                  color: const Color(0xFF2E2E2E),
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children:
                    travelData.map((entry) {
                      return _buildDateGroup(entry['date'], entry['trips']);
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Flexible(
              child: Container(
                width: 40,
                height: 47,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x591D1D1D),
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 183, 183, 183),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/Vector.svg',
                        width:
                            12, // ajusta al tamaño que veas en Figma (ej. 12x12)
                        height: 12,
                        color:
                            Colors
                                .white, // asegúrate que el SVG sea blanco o aplícale color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFE0E0E0),
            child: Icon(Icons.person, color: Colors.grey, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildDateGroup(String date, List<Map<String, dynamic>> trips) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          ...trips.map((trip) => _buildTripCard(trip)).toList(),
        ],
      ),
    );
  }

  Widget _buildTripCard(Map<String, dynamic> trip) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Card(
        color: Colors.white, // Fondo blanco
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade300), // Contorno gris claro
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip['time'],
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.place, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            trip['route'],
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Placa: ${trip['plate']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Icon(trip['vehicle'], size: 30, color: Colors.teal),
                  SizedBox(height: 6),
                  Text(
                    trip['price'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(Icons.home, false, () {
            // Estás en Home, no haces nada
          }),
          _buildBottomNavItem(Icons.access_time, true, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TravelHistoryScreen()),
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
    );
  }

  Widget _buildBottomNavItem(
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 28,
        color: isSelected ? const Color(0xFF409686) : Colors.grey,
      ),
    );
  }
}
