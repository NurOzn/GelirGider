

import 'package:gelir_gider_app/modules/transaction/controllers/transaction_controller.dart';
import 'package:get/instance_manager.dart';

class TranscationBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(()=>TransactionController());
  }
}