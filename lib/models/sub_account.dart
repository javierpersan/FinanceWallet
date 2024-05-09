class SubAccount {
  String name;
  double balance;
  double percentage;
  String color;  // Código hexadecimal para el color

  SubAccount({
    required this.name,
    this.balance = 0.0,
    required this.percentage,
    required this.color,
  });

  // Método para actualizar el saldo de la subcuenta
  void updateBalance(double amount) {
    balance += amount;
  }
}
