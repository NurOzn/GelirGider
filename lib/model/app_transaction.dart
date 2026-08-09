class AppTransaction {
  final String? id;
  final double? amount;
  final String? type;
  final String? description;
  final DateTime? date;
  final String? categoryId;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Category? category;

  AppTransaction({
    this.id,
    this.amount,
    this.type,
    this.description,
    this.date,
    this.categoryId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory AppTransaction.fromJson(Map<String, dynamic> json) => AppTransaction(
        id: json["id"],
        amount: (json["amount"] as num?)?.toDouble(),
        type: json["type"],
        description: json["description"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        categoryId: json["category_id"],
        userId: json["user_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        category: json["Category"] == null ? null : Category.fromJson(json["Category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "type": type,
        "description": description,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "category_id": categoryId,
        "user_id": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Category": category?.toJson(),
      };
}

class Category {
  final String? name;
  final String? icon;
  final String? type;

  Category({
    this.name,
    this.icon,
    this.type,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        icon: json["icon"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
        "type": type,
      };
}