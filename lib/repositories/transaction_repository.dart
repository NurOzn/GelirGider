import 'package:gelir_gider_app/model/app_transaction.dart';
import 'package:gelir_gider_app/model/transaction_params.dart';
import 'package:gelir_gider_app/services/api_service.dart';
import 'package:get/get.dart';

class TransactionRepository extends GetxService {
  late final ApiService _apiService;

  @override
  void onInit() {
    super.onInit();
    _apiService = Get.find<ApiService>();
  }

  Future<List<AppTransaction>> getTransactions() async {
    final response = await _apiService.get(ApiConstants.transactions);
    if (response.statusCode == 200) {
      var gelenListe = response.data["transactions"] as List;
      return gelenListe
          .map((transaction) => AppTransaction.fromJson(transaction))
          .toList();
    }
    throw Exception("Transactionlar getirilirken hata oluştu");
  }

  Future<AppTransaction> createTransaction(Transaction transaction) async {
    final response = await _apiService.post(
      ApiConstants.transactions,
      data: transaction.toJson(),
    );
    if (response.statusCode == 201) {
      return AppTransaction.fromJson(response.data);
    }
    throw Exception("Transaction eklenirken bir hata oluştu");
  }

  Future<bool> deleteTransaction(String id) async {
    final response = await _apiService.delete(
      "${ApiConstants.transactions}/$id",
    );
    print(response.data);
    if (response.statusCode == 200) {
      return true;
    }
    throw Exception("Transaction silinemedi bir hata oluştu");
  }
}
