class Animal {
  final String name;
  final String type;
  final num weight; // kg
  final num height; // cm
  final List<String> habitat;
  final List<String> activities;
  final String image;

  const Animal({
    required this.name,
    required this.type,
    required this.weight,
    required this.height,
    required this.habitat,
    required this.activities,
    required this.image,
  });
}
