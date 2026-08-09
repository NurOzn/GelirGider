import 'package:flutter/material.dart';
import 'package:gelir_gider_app/themes/app_colors.dart';

enum SummaryCardType { income, expense, primary }

class SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;
  final SummaryCardType type;
  

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.type,
    required this.icon,
  });

  Gradient _resolveGradient(bool isDark) {
    switch (type) {
      case SummaryCardType.income:
        return isDark ? AppColors.incomeGradientDark : AppColors.incomeGradient;
      case SummaryCardType.expense:
        return isDark ? AppColors.expenseGradientDark : AppColors.expenseGradient;
      case SummaryCardType.primary:
        return isDark ? AppColors.primaryGradientDark : AppColors.primaryGradient;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        gradient: _resolveGradient(isDark),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 16, color: Colors.white),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    title,
                    style:Theme.of(context).textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white , fontSize: 
                    14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "₺${amount.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}