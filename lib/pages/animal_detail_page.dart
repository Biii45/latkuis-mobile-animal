import "package:flutter/material.dart";
import "../models/animal.dart";
import "../widgets/tag_chip.dart";

class AnimalDetailPage extends StatelessWidget {
  final Animal animal;
  const AnimalDetailPage({super.key, required this.animal});

  Widget _section(String title) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      );

  Widget _row(IconData icon, String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.deepPurple),
            const SizedBox(width: 8),
            SizedBox(width: 80, child: Text(label)),
            Text(": $value", style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(animal.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: animal.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  animal.image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(
                      height: 220,
                      child: Center(child: Icon(Icons.broken_image, size: 48))),
                ),
              ),
            ),
            _section("Animal Details"),
            _row(Icons.pets, "Name", animal.name),
            _row(Icons.category, "Type", animal.type),
            _row(Icons.height, "Height", "${animal.height} cm"),
            _row(Icons.monitor_weight, "Weight", "${animal.weight} kg"),
            _section("Habitat"),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: animal.habitat.map((h) => TagChip(h)).toList()),
            _section("Animal Activities"),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: animal.activities.map((a) => TagChip(a)).toList()),
          ],
        ),
      ),
    );
  }
}
