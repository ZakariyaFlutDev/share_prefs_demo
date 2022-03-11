class Account{
  String id = "";
  String name = "";
  String email = "";
  String phone ="";
  String password ="";
  String cpassword ="";

  Account.from({required this.name, required this.email, required this.phone, required this.password, required this.cpassword});

  Account.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      email = json['email'],
      phone = json['phone'],
      password = json['password'],
      cpassword = json['cpassword'];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "email" : email,
    "phone" : phone,
    "password" : password,
    "cpassword" : cpassword
  };
}