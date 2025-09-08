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
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          "Absen: $absen | Kelas: $kelas",
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
