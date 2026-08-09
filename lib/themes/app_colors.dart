import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan renk paleti.
/// Tüm renkler burada tanımlanır, widget'larda doğrudan Color(0xFF...) kullanma.
abstract class AppColors {
  // ---- Marka / Ana Renkler ----
  static const Color primary = Color(0xFF2E5EAA); // Ana marka rengi (mavi)
  static const Color primaryLight = Color(0xFF5B85C9);
  static const Color primaryDark = Color(0xFF1A3D75);

  static const Color secondary = Color(0xFF00BFA5); // Vurgu rengi (turkuaz)
  static const Color secondaryLight = Color(0xFF5DF2D6);
  static const Color secondaryDark = Color(0xFF008E76);

  // ---- Gelir / Gider Renkleri ----
  static const Color income = Color(0xFF2E7D32); // Gelir - yeşil
  static const Color incomeLight = Color(0xFFA5D6A7);
  static const Color incomeBackground = Color(0xFFE8F5E9);

  static const Color expense = Color(0xFFD32F2F); // Gider - kırmızı
  static const Color expenseLight = Color(0xFFEF9A9A);
  static const Color expenseBackground = Color(0xFFFFEBEE);

  static const Color neutral = Color(0xFFFF9800); // Bekleyen / nötr işlemler - turuncu

  // ---- Durum Renkleri ----
  static const Color success = Color(0xFF43A047);
  static const Color warning = Color(0xFFF9A825);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF1E88E5);

  // ---- Nötr / Arayüz Renkleri (Light Mode) ----
  static const Color background = Color(0xFFF5F6FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE0E0E0);

  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF6E6E73);
  static const Color textHint = Color(0xFFAEAEB2);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ---- Nötr / Arayüz Renkleri (Dark Mode) ----
  static const Color backgroundDark = Color(0xFF121214);
  static const Color surfaceDark = Color(0xFF1C1C1E);
  static const Color cardDark = Color(0xFF242426);
  static const Color dividerDark = Color(0xFF3A3A3C);

  static const Color textPrimaryDark = Color(0xFFF2F2F7);
  static const Color textSecondaryDark = Color(0xFFAEAEB2);
  static const Color textHintDark = Color(0xFF6E6E73);

  // ---- Kategori Renkleri (grafik/etiket için önerilen palet) ----
  static const List<Color> categoryPalette = [
    Color(0xFF2E5EAA), // mavi
    Color(0xFF00BFA5), // turkuaz
    Color(0xFFFF9800), // turuncu
    Color(0xFF8E24AA), // mor
    Color(0xFFD32F2F), // kırmızı
    Color(0xFF43A047), // yeşil
    Color(0xFFFDD835), // sarı
    Color(0xFF6D4C41), // kahverengi
    Color(0xFF546E7A), // gri-mavi
    Color(0xFFEC407A), // pembe
  ];

  // ---- Dark Mode Vurgu Renkleri ----
  static const Color darkExpense = Color(0xFFEF9A9A);
  static const Color darkIncome = Color(0xFFA5D6A7);
  static const Color darkTextPrimary = Color(0xFFF2F2F7);

  // ---- Gradientler ----
  // Ana bakiye kartı, öne çıkan butonlar için
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryDark],
  );

  // Gelir kartı / gelir grafiği için
  static const LinearGradient incomeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF43A047), income],
  );

  static const LinearGradient incomeGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
  );

  // Gider kartı / gider grafiği için
  static const LinearGradient expenseGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEF5350), expense],
  );

  static const LinearGradient expenseGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFC62828), Color(0xFF8E0000)],
  );

  // Dashboard üst bakiye kartı - marka rengi ile vurgu rengi karışımı
  static const LinearGradient balanceCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondaryDark],
  );

  static const LinearGradient balanceCardGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDark, Color(0xFF0D2340)],
  );

  static const LinearGradient primaryGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDark, Color(0xFF0D2340)],
  );

  // Splash / login arka planı için yumuşak geçiş
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [surface, background],
  );

  static const LinearGradient backgroundGradientDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [surfaceDark, backgroundDark],
  );
}