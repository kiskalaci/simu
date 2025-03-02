import "package:flutter/material.dart";
import "package:simu/features/dashboard/widgets/settings_tab.dart";
import "package:simu/features/dashboard/widgets/transactions_tab.dart";
import "package:simu/i18n/strings.g.dart";
import "package:simu/theme/color_palette.dart";

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  final List<Widget> tabs = const <Widget>[SettingsTab(), TransactionsTab()];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = ColorPalette.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.transactions.title)),
      body: Center(child: tabs.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedItemColor: colors.blue,
        unselectedItemColor: colors.secondary,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: t.settings,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.compare_arrows_outlined),
            label: t.transactions.title,
          ),
        ],
      ),
    );
  }
}
