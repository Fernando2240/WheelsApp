import 'package:flutter/material.dart';
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
      ]
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
      ]
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
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: travelData.map((entry) {
                  return _buildDateGroup(entry['date'], entry['trips']);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        children: [
          Icon(Icons.arrow_back, size: 28),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Historial de viajes',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.jpg'), // Usa una imagen local o red
            radius: 20,
          )
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
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    Text('Placa: ${trip['plate']}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
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
                    style: TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}