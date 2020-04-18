class Product{
  String title;
  String description;
  double price;
  String category;

  Product({this.title,this.description,this.price, this.category});

   Map<String, dynamic> toMap(){
     return{
       'id': Uuid().v1(),
       'title':title,
       'description':description,
       'price' : price
     }
   }
}