import 'package:firebase_database/firebase_database.dart';

class UserModel{
  String? name;
  String? phone;
  String? email;
  String? address;
  String? id;

  UserModel({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.id
  });
UserModel.fromSnapshot(DataSnapshot snap){
  name = (snap.value as dynamic)[name];
  phone = (snap.value as dynamic)[phone];
  email = (snap.value as dynamic)[email];
  address = (snap.value as dynamic)[address];
  name = snap.key;
}
}