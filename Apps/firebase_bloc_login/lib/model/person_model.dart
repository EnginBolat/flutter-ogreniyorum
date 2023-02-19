class Person {
  String? email;
  String? name;
  String? password;
  String? phone;
  String? surname;

  Person({this.email, this.name, this.password, this.phone, this.surname});

  Person.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    data['phone'] = phone;
    data['surname'] = surname;
    return data;
  }
}
