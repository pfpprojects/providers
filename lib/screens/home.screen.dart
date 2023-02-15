import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/manager.provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              // هنا قمنا بوضع المستهلك في القائمة
              // وبعد ذل نقوم بتعريف  دالة البناء داخل المستهلك
              // دالة البناء يمكن ان ترجع عناصر بحسب رغبة المبرمج
              // في مثالنا ترجع قيمة التكرار الحالية
              Consumer<ManagerProvider>(
                builder: (context, manager, child) => Text(
                  "قيمة العداد\n${manager.counter}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ActionChip(
                backgroundColor: Colors.green,
                avatar: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text(
                  "ايقاف العداد",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  // في هذا السطر يمكننا تشغيل او استدعاء اي دالة او قيمة من
                  // المزود دون الحاجة الى الاستماع الى قيم المزود وتحديثاتها
                  // وهنا تكون الفائدة من هذه الطريقة حيث انك يمكنك ان
                  // تستدعي احدا دالات العداد دون التاثير على محتوى واجهتك الحالية

                  Provider.of<ManagerProvider>(context, listen: false)
                      .stopCounting()
                },
              ),
              const Divider(color: Colors.transparent),
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
