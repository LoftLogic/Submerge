import 'package:flutter/material.dart';
import 'screens/buddy_page.dart';
import 'screens/profile_page.dart';
import 'screens/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Submerge',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF03045E),
          secondary: Color(0xFF5CB1ED),
          surface: Color(0xFF00B4D8),
          background: Color(0xFF03045E),
          error: Colors.red,
        ),
        scaffoldBackgroundColor: const Color(0xFF03045E),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentPage = 'buddy';

  void _navigateTo(String page) {
    if (mounted) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  Widget _buildPage() {
    switch (_currentPage) {
      case 'buddy':
        return const BuddyPage();
      case 'profile':
        return const ProfilePage();
      case 'settings':
        return const SettingsPage();
      default:
        return const BuddyPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.transparent,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28,
                    ),
                    color: const Color(0xFF03045E),
                    onSelected: _navigateTo,
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: 'buddy',
                        child: Row(
                          children: [
                            const Icon(Icons.people_outline, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              'Buddy',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'profile',
                        child: Row(
                          children: [
                            const Icon(Icons.person_outline, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              'Profile',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'settings',
                        child: Row(
                          children: [
                            const Icon(Icons.settings_outlined, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              'Settings',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _navigateTo('buddy'),
                    child: const Text(
                      'submerge',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: _buildPage(),
      ),
    );
  }
}
