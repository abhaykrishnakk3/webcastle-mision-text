// // To parse this JSON data, do
// //
// //     final allData = allDataFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// AllData allDataFromJson(String str) => AllData.fromJson(json.decode(str));

// class AllData {
//   int? errorCode;
//   String? message;
//   Data? data;

//   AllData({
//     this.errorCode,
//     this.message,
//     this.data,
//   });

//   factory AllData.fromJson(Map<String, dynamic> json) => AllData(
//         errorCode: json["error_code"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );
// }

// class Data {
//   List<HomeField>? homeFields;

//   Data({
//     this.homeFields,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         homeFields: List<HomeField>.from(
//             json["home_fields"].map((x) => HomeField.fromJson(x))),
//       );
// }

// class HomeField {
//   String? type;
//   List<Banner>? carouselItems;
//   List<Brand>? brands;
//   List<Brand>? categories;
//   String? image;
//   int? collectionId;
//   String? name;
//   List<Product>? products;
//   List<Banner>? banners;
//   Banner? banner;

//   HomeField({
//     this.type,
//     this.carouselItems,
//     this.brands,
//     this.categories,
//     this.image,
//     this.collectionId,
//     this.name,
//     this.products,
//     this.banners,
//     this.banner,
//   });

//   factory HomeField.fromJson(Map<String, dynamic> json) => HomeField(
//         type: json["type"],
//         carouselItems: List<Banner>.from(
//             json["carousel_items"].map((x) => Banner.fromJson(x))),
//         brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
//         categories:
//             List<Brand>.from(json["categories"].map((x) => Brand.fromJson(x))),
//         image: json["image"],
//         collectionId: json["collection_id"],
//         name: json["name"],
//         products: List<Product>.from(
//             json["products"].map((x) => Product.fromJson(x))),
//         banners:
//             List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
//         banner: Banner.fromJson(json["banner"]),
//       );
// }

// class Banner {
//   String? image;
//   String? type;
//   int? id;

//   Banner({
//     this.image,
//     this.type,
//     this.id,
//   });

//   factory Banner.fromJson(Map<String, dynamic> json) => Banner(
//         image: json["image"],
//         type: json["type"],
//         id: json["id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "image": image,
//         "type": type,
//         "id": id,
//       };
// }

// class Brand {
//   int? id;
//   String? name;
//   String? image;

//   Brand({
//     this.id,
//     this.name,
//     this.image,
//   });

//   factory Brand.fromJson(Map<String, dynamic> json) => Brand(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//       };
// }

// class Product {
//   int? id;
//   String? image;
//   String? name;
//   String? currency;
//   String? unit;
//   double? price;
//   int? actualPrice;
//   String? offer;
//   bool? wishlisted;
//   bool? rfqStatus;

//   Product({
//     this.id,
//     this.image,
//     this.name,
//     this.currency,
//     this.unit,
//     this.price,
//     this.actualPrice,
//     this.offer,
//     this.wishlisted,
//     this.rfqStatus,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         image: json["image"],
//         name: json["name"],
//         currency: json["currency"],
//         unit: json["unit"],
//         price: json["price"]?.toDouble(),
//         actualPrice: json["actual_price"],
//         offer: json["offer"],
//         wishlisted: json["wishlisted"],
//         rfqStatus: json["rfq_status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "name": name,
//         "currency": currency,
//         "unit": unit,
//         "price": price,
//         "actual_price": actualPrice,
//         "offer": offer,
//         "wishlisted": wishlisted,
//         "rfq_status": rfqStatus,
//       };
// }

// To parse this JSON data, do
//
//     final allData = allDataFromJson(jsonString);

import 'dart:convert';

AllData allDataFromJson(String str) => AllData.fromJson(json.decode(str));

String allDataToJson(AllData data) => json.encode(data.toJson());

class AllData {
    int errorCode;
    String message;
    Data data;

    AllData({
        required this.errorCode,
        required this.message,
        required this.data,
    });

    factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        errorCode: json["error_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<HomeField> homeFields;

    Data({
        required this.homeFields,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        homeFields: List<HomeField>.from(json["home_fields"].map((x) => HomeField.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "home_fields": List<dynamic>.from(homeFields.map((x) => x.toJson())),
    };
}

class HomeField {
    String type;
    List<Banner>? carouselItems;
    List<Brand>? brands;
    List<Brand>? categories;
    String? image;
    int? collectionId;
    String? name;
    List<Product>? products;
    List<Banner>? banners;
    Banner? banner;

    HomeField({
        required this.type,
        this.carouselItems,
        this.brands,
        this.categories,
        this.image,
        this.collectionId,
        this.name,
        this.products,
        this.banners,
        this.banner,
    });

    factory HomeField.fromJson(Map<String, dynamic> json) => HomeField(
        type: json["type"],
        carouselItems: json["carousel_items"] == null ? [] : List<Banner>.from(json["carousel_items"]!.map((x) => Banner.fromJson(x))),
        brands: json["brands"] == null ? [] : List<Brand>.from(json["brands"]!.map((x) => Brand.fromJson(x))),
        categories: json["categories"] == null ? [] : List<Brand>.from(json["categories"]!.map((x) => Brand.fromJson(x))),
        image: json["image"],
        collectionId: json["collection_id"],
        name: json["name"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
        banner: json["banner"] == null ? null : Banner.fromJson(json["banner"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "carousel_items": carouselItems == null ? [] : List<dynamic>.from(carouselItems!.map((x) => x.toJson())),
        "brands": brands == null ? [] : List<dynamic>.from(brands!.map((x) => x.toJson())),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "image": image,
        "collection_id": collectionId,
        "name": name,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "banner": banner?.toJson(),
    };
}

class Banner {
    String image;
    String type;
    int id;

    Banner({
        required this.image,
        required this.type,
        required this.id,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        image: json["image"],
        type: json["type"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "type": type,
        "id": id,
    };
}

class Brand {
    int id;
    String name;
    String image;

    Brand({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}

class Product {
    int id;
    String image;
    String name;
    String currency;
    String unit;
    double price;
    int actualPrice;
    String offer;
    bool wishlisted;
    bool rfqStatus;

    Product({
        required this.id,
        required this.image,
        required this.name,
        required this.currency,
        required this.unit,
        required this.price,
        required this.actualPrice,
        required this.offer,
        required this.wishlisted,
        required this.rfqStatus,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        currency: json["currency"],
        unit: json["unit"],
        price: json["price"]?.toDouble(),
        actualPrice: json["actual_price"],
        offer: json["offer"],
        wishlisted: json["wishlisted"],
        rfqStatus: json["rfq_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "currency": currency,
        "unit": unit,
        "price": price,
        "actual_price": actualPrice,
        "offer": offer,
        "wishlisted": wishlisted,
        "rfq_status": rfqStatus,
    };
}

