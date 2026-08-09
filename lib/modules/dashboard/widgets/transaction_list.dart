import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/dashboard/dashboard_controller.dart';
import 'package:gelir_gider_app/themes/app_colors.dart';
import 'package:gelir_gider_app/utils/icon_helper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionList extends GetView<DashboardController> {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.myTransaction.isEmpty) {
        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 48,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textHintDark
                        : AppColors.primary.withAlpha(128),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Henüz kayıtlı bir transaction yok",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.textHintDark
                          : AppColors.primary.withAlpha(128),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      return Card(
        shape: BeveledRectangleBorder(),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var oankiTransaction = controller.myTransaction[index];
            var category = oankiTransaction.category;
            return Dismissible(
              key: ValueKey(oankiTransaction.id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                controller.DeleteTransactions(oankiTransaction.id!);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? (oankiTransaction.type == "income")
                              ? AppColors.darkIncome.withAlpha(25)
                              : AppColors.darkExpense.withAlpha(25)
                        : (oankiTransaction.type == "income")
                        ? AppColors.income.withAlpha(25)
                        : AppColors.expense.withAlpha(25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    getCategoryIcon(
                      iconName: category!.icon!,
                      isSystem: true,
                      type: category.type!,
                    ),
                    color: oankiTransaction.type == "income"
                        ? (Theme.of(context).brightness == Brightness.dark)
                              ? AppColors.darkIncome
                              : AppColors.income
                        : (Theme.of(context).brightness == Brightness.dark)
                        ? AppColors.darkExpense
                        : AppColors.expense,
                  ),
                ),
                title: Text(category?.name ?? ""),
                subtitle: Text(oankiTransaction.description!),
                trailing: Column(
                  children: [
                    Text(
                      "${oankiTransaction.type == "income" ? "+" : "-"}. ${NumberFormat.currency(symbol: "tl", decimalDigits: 2).format(oankiTransaction.amount)}",
                      style: TextStyle(
                        color: oankiTransaction.type == "income"
                            ? (Theme.of(context).brightness == Brightness.dark)
                                  ? AppColors.darkIncome
                                  : AppColors.income
                            : (Theme.of(context).brightness == Brightness.dark)
                            ? AppColors.darkExpense
                            : AppColors.expense,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat("dd/MM/yyyy").format(oankiTransaction.date!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color:  Theme.of(context).brightness == Brightness.dark ? AppColors.darkTextPrimary : AppColors.textPrimary)),
                   
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(height: 1);
          },
          itemCount: controller.myTransaction.length,
        ),
      );
    });
  }
}
