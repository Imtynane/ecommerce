class Product {
  int _id;
  String _title = "", _description = "", _image = "";

  Product(this._id, this._title, this._description, this._image);

  int get id => _id;
  set id(int id) {
    _id = id;
  }

  String get title => _title;
  set title(String title) {
    _title = title;
  }

  String get description => _description;
  set description(String description) {
    _description = description;
  }

  String get image => _image;
  set image(String image) {
    _image = image;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json["id"],
      json["title"],
      json["description"],
      json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": _id,
      "title": _title,
      "description": _description,
      "image": _image,
    };
  }

  static List<Product> toList(json) {
    return json.map((data) => Product.fromJson(data)).toList();
  }
}
