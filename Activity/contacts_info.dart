class Contact{
  String name;
  String email;
  Contact({
    required this.name,
    required this.email,

  });
      factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
    };
}
