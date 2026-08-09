import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/dashboard/dashboard_controller.dart';
import 'package:gelir_gider_app/modules/dashboard/widgets/summary_card.dart';
import 'package:gelir_gider_app/modules/dashboard/widgets/transaction_list.dart';
import 'package:gelir_gider_app/themes/app_colors.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(
                      () => ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        children: [
                          SummaryCard(
                            title: "Aylık Gelir",
                            amount: controller.aylikGelir.value,

                            icon: Icons.arrow_upward,
                            type: SummaryCardType.income,
                          ),
                          SummaryCard(
                            title: "Aylık Gider",
                            amount: controller.aylikGider.value,

                            icon: Icons.arrow_downward,
                            type: SummaryCardType.expense,
                          ),
                          SummaryCard(
                            title: "Aylık Bakiye",
                            amount:
                                controller.aylikGelir.value -
                                controller.aylikGider.value,

                            icon: Icons.account_balance_wallet,
                            type: SummaryCardType.primary,
                          ),
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(child: TransactionList(), flex: 9),
                ],
              ),
      ),
    );
  }
}
