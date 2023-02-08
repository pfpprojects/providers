import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/manager.provider.dart';

// لاحظ ان هذه الواجهة عبارة عن حيث
// (StatelessWidget)
// ان عملية تحديث الصفحة تتم عن طريق المزود
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا نعطي هذه الصفحة خاصية مراقبة المزود
    // في حال ان المزود يغير احد القيم الخاصة به عن طريق
    // notifyListeners()
    // فسيتم تحديث هذه الصفحة تلقائيا
    // كما يمكن استدعاء دالات المزود ايضا عن طريق هذا المتغير
    // managerProvider
    // مثال
    // managerProvider.stopCounting(),
    final ManagerProvider managerProvider = context.watch<ManagerProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              managerProvider.isCounting
                  ? ActionChip(
                      backgroundColor: Colors.redAccent,
                      avatar: const Icon(
                        Icons.pause,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "ايقاف العداد",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => {
                        managerProvider.stopCounting(),
                      },
                    )
                  : ActionChip(
                      backgroundColor: Colors.green,
                      avatar: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "ابدأ العداد",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => {
                        managerProvider.startCounting(),
                      },
                    ),
              if (managerProvider.counter > 0)
                const Divider(color: Colors.transparent),
              if (managerProvider.counter > 0)
                ActionChip(
                  backgroundColor: Colors.amber,
                  avatar: const Icon(
                    Icons.restore,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "اعادة ضبط العداد",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => {
                    managerProvider.resetCounter(),
                  },
                ),
              const Divider(color: Colors.transparent),
              ActionChip(
                backgroundColor: Colors.green,
                avatar: const Icon(Icons.home, color: Colors.white),
                label: const Text(
                  "اذهب الى الصفحة التالية",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  Navigator.of(context).pushNamed('/home-screen'),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
