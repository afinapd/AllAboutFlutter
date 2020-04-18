class Parking{
  final String id;
  final String name;
  final String plat;
  final String price;

  Parking({this.id,this.name,this.plat,this.price});

  factory Parking.fromJSON(Map<String, dynamic> json){
    return Parking(
      id: json['id'],
      name: json['name'],
      plat: json['plat'],
      price: json['price']
    );
  }
}