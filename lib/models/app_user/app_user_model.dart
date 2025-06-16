class AppUser {
  final String uid;
  final String name;
  final String email;
  final String? photoUrl;
  final String? password;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
    this.password,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'password': password,
    };
  }

  AppUser copyWith({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
    String? password,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      password: password ?? this.password,
    );
  }
}
