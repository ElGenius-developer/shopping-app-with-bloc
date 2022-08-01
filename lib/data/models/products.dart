class Products {
  int? id;
  String? title;
  String? price;
  String? oldPrice;
  String? description;
  String? category;
  String? image;
  String? type;
  var rate;
  String? size;
  String? color;
  String? error;


  Products(
      {this.id,
        this.title,
        this.price,
        this.type,
        this.rate,
        this.size,
        this.color,
        this.description,
        this.category,
        this.image,
        this.oldPrice
      });

  Products.fromJson(Map<String, dynamic> json) {
  if(json!=null)
    id = json['id'];
  rate = json['rate'];
  title = json['title'];
  price = json['price'];
  oldPrice = json['oldPrice'];
  type = json['type'];
  size=json['size']??'null';
  color=json['color'];
  description = json['description'];
  category = json['category'];
  image = json['image']??'https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rate'] = this.rate;
    data['price'] = this.price;
    data['oldPrice'] = this.oldPrice;
    data['type'] = this.type;
    data['size']=this.size;
    data['color']=this.color;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }
  Products.error({this.error});
}