// account.dart
import 'sub_account.dart';  // Asegúrate de usar la ruta correcta del paquete

class Account {
  String name;
  double totalBalance;
  List<SubAccount> subAccounts;  // Usando SubAccount de sub_account.dart

  Account({
    required this.name,
    this.totalBalance = 0.0,
    List<SubAccount>? subAccounts,
  }) : subAccounts = subAccounts ?? [];  // Asigna una lista vacía si subAccounts es null

  void addSubAccount(SubAccount subAccount) {
    subAccounts.add(subAccount);
    updateTotalBalance();
  }

  void updateTotalBalance() {
    totalBalance = subAccounts.fold(0.0, (sum, sub) => sum + sub.balance);
  }
}
