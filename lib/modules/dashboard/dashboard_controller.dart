import 'package:flutter/widgets.dart';
import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/model/app_transaction.dart';
import 'package:gelir_gider_app/repositories/transaction_repository.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  late final TransactionRepository _transactionRepository;
  final myTransactions = <AppTransaction>[].obs;

  final aylikGelir = 0.0.obs;
  final aylikGider = 0.0.obs;

  void aylikOzet() {
      aylikGelir.value = 0;
      aylikGider.value = 0;
    var simdikiTarih = DateTime.now();
    var oankiYil = simdikiTarih.year;
    var oankiAy = simdikiTarih.month;

    if (myTransactions.isNotEmpty) {
      var filteredTransaction = myTransaction
          .where(
            (transaction) =>
                transaction.date!.year == oankiYil &&
                transaction.date!.month == oankiAy,
          )
          .toList();

      for (var tr in filteredTransaction) {
        if (tr.type == "income") {
          aylikGelir.value += (tr.amount!);
        } else {
          aylikGider.value += (tr.amount!);
        }
      }
    } else {
      aylikGelir.value = 0;
      aylikGider.value = 0;
    }
    debugPrint("aylik gelir :$aylikGelir Gider: $aylikGider");
  }

  @override
  void onInit() async {
    super.onInit();
    _transactionRepository = Get.find<TransactionRepository>();
    await getTransactions();
  }

  Future<void> refreshDashboard() async {
    await getTransactions();
  }

  final myTransaction = <AppTransaction>[].obs;

  Future getTransactions() async {
    try {
      setLoading(true);
      final transactions = await _transactionRepository.getTransactions();
      myTransaction.value = transactions;
      aylikOzet();
    } catch (e) {
      showErrorSnackbar(message: "veriler getirlirken hata oluştu");
    } finally {
      setLoading(false);
    }
  }

  Future DeleteTransactions(String id) async {
    try {
      //setLoading(true);
      final transactions = await _transactionRepository.deleteTransaction(id);
      myTransaction.removeWhere((element) => element.id == id);
      aylikOzet();
      showSuccessSnackbar(message: "Transaction silindi");
    } catch (e) {
      showErrorSnackbar(message: "veriler getirlirken hata oluştu");
    } finally {
      // setLoading(false);
    }
  }
}
