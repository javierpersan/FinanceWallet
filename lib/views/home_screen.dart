// home_screen.dart
import 'package:flutter/material.dart';
import '../models/account.dart'; // Asegúrate de que este importe refleje la ubicación real de tu modelo de Account
import '../models/sub_account.dart'; // Asegúrate de que este importe refleje la ubicación real de tu modelo de SubAccount

class HomeScreen extends StatefulWidget {
  final Account account;

  HomeScreen({required this.account});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMenuExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.grey.shade800], // Personaliza según tu diseño
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    widget.account.name,
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '€${widget.account.totalBalance.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  ...widget.account.subAccounts.map((subAccount) => buildAccountCard(subAccount)).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingMenu(),
    );
  }

  Widget buildAccountCard(SubAccount subAccount) {
    return Card(
      color: Color(int.parse(subAccount.color.replaceFirst('#', '0xff'))),
      child: ListTile(
        title: Text(subAccount.name, style: TextStyle(color: Colors.white)),
        subtitle: Text('€${subAccount.balance.toStringAsFixed(2)}', style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
      ),
    );
  }

  Widget buildFloatingMenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isMenuExpanded) ...[
          IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.add, color: Colors.white), onPressed: () {}),
        ],
        FloatingActionButton(
          child: Icon(isMenuExpanded ? Icons.close : Icons.menu, color: Colors.white),
          onPressed: () {
            setState(() {
              isMenuExpanded = !isMenuExpanded;
            });
          },
          backgroundColor: Colors.red,
        ),
      ],
    );
  }
}
