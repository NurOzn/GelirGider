import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/transaction/controllers/transaction_controller.dart';
import 'package:gelir_gider_app/utils/icon_helper.dart';
import 'package:get/get.dart';

class CategoryDropdown extends GetView<TransactionController> {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: "Kategori",
          border: OutlineInputBorder(),
        ),
        value: controller.selectedCategoryId.value.isEmpty
            ? null
            : controller.selectedCategoryId.value,
        items: controller.categories
            .where((cat) => cat.type == controller.transactionType.value)
            .map(
              (category) => DropdownMenuItem(
                value: category.id,
                child: Row(
                  children: [
                    Icon(
                      getCategoryIcon(
                        iconName: category.icon!,
                        isSystem: category.isSystem!,
                        type: category.type!,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(category.name!),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          controller.selectedCategoryId.value = value!;
        },
      ),
    );
  }
}