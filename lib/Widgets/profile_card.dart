import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String absen;
  final String kelas;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.absen,
    required this.kelas,
    this.imageUrl = "",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              "Absen: $absen",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Text(
              "Kelas: $kelas",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
