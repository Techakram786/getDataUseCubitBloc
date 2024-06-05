class ProductModel{
  int? id;
  String? title;
  dynamic price;
  String? image;

  ProductModel({this.id,this.title,this.price,this.image});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
    );
  }
}