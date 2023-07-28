class Usuario {
  String? id;
  String? email;
  String? name;
  String? surname;
  String? phone;

  //internal field
  String? password;

  Usuario({
    this.id,
    this.email,
    this.name,
    this.surname,
    this.phone,
    this.password,
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    name = json['name'];
    surname = json['surname'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['email'] = email;
    data['nome'] = name;
    data['sobrenome'] = surname;
    data['telefone'] = phone;
    data['password'] = password;
    data['documento_tipo'] = "CPF";
    data['documento'] = "181.343.387-98";
    data['firebase_id'] = DateTime.now().millisecondsSinceEpoch.toString();
    return data;
  }
}
