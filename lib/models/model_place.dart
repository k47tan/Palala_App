class Place {
  String? id;
  String? name;
  String? description;
  String? image;
  String? location;

  Place({
    this.id,
    this.name,
    this.description,
    this.image,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'location': location,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map, String id) {
    return Place(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      location: map['location'],
    );
  }
}
