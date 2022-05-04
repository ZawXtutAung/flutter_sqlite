class MyDatabase {
  int? id;
  String? name;
  String? address;
  String? phone;

  MyDatabase({this.id, this.name, this.address, this.phone});
  MyDatabase.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    address = map['address'];
    phone = map['phone'];
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'address': address, 'phone': phone};
  }
}
