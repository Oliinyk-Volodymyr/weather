class City {
  final String name;

  final double longitude;
  final double latitude;

  @override
  int get hashCode => name.hashCode ^ longitude.hashCode ^ latitude.hashCode;

  const City({
    required this.name,
    required this.longitude,
    required this.latitude,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is City && other.name == name && other.longitude == longitude && other.latitude == latitude;
  }
}
