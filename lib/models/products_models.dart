// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromJson(jsonString);

import 'dart:convert';

ProductsResponse productsResponseFromJson(String str) => ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) => json.encode(data.toJson());

class ProductsResponse {
    ProductsResponse({
        this.ok,
        this.products,
    });

    bool ok;
    List<Product> products;

    factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
        ok: json["ok"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.available,
        this.state,
        this.id,
        this.title,
        this.desc,
        this.price,
        this.img,
        this.detailImg,
        this.category,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    bool available;
    bool state;
    String id;
    String title;
    String desc;
    double price;
    String img;
    String detailImg;
    ProductCategory category;
    User user;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        state: json["state"],
        id: json["_id"],
        title: json["title"],
        desc: json["desc"],
        price: json["price"].toDouble(),
        img: json["img"],
        detailImg: json["detailImg"],
        category: ProductCategory.fromJson(json["category"]),
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "state": state,
        "_id": id,
        "title": title,
        "desc": desc,
        "price": price,
        "img": img,
        "detailImg": detailImg,
        "category": category.toJson(),
        "user": user.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class ProductCategory {
    ProductCategory({
        this.state,
        this.id,
        this.desc,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    bool state;
    String id;
    String desc;
    String user;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
        state: json["state"],
        id: json["_id"],
        desc: json["desc"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "_id": id,
        "desc": desc,
        "user": user,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class User {
    User({
        this.id,
        this.email,
    });

    String id;
    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
    };
}
