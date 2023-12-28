class Contact {
  static String table = "contact";

  int? id;
  String? nom;
  int? tel;

  Contact({this.id, this.nom, this.tel});

  static Contact fromJson(Map<String, dynamic> json) {
    return Contact(
        id: json['id'], nom: json['nom'].toString(), tel: json['tel']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'tel': tel,
    };
  }
}
