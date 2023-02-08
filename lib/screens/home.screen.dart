import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/manager.provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا نعطي هذه الصفحة خاصية مراقبة المزود
    // في حال ان المزود يغير احد القيم الخاصة به عن طريق
    // notifyListeners()
    // فسيتم تحديث هذه الصفحة تلقائيا
    final ManagerProvider managerProvider = context.watch<ManagerProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(
                "قيمة العداد\n${managerProvider.counter}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              ActionChip(
                backgroundColor: Colors.green,
                avatar: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text(
                  "عودة الى الصفحة الرئيسية",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  Navigator.of(context).pushNamed('/start-screen'),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
