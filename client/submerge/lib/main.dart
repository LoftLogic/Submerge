import 'package:flutter/material.dart';
import 'screens/buddy_page.dart';
import 'screens/profile_page.dart';
import 'screens/settings_page.dart';
import 'screens/feed_page.dart';
import 'services/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Submerge',
      builder: (context, child) {
        return MediaQuery(
          // Force mobile width
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
            devicePixelRatio: 1.0,
          ),
          child: Container(
            color: const Color(0xFF020230),  // Darker blue for outer area
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 480),
                color: const Color(0xFF03045E),  // Original blue for the app view
                child: child!,
              ),
            ),
          ),
        );
      },
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
  String _currentPage = 'feed';
  final _authService = AuthService();
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginState();
  }

  Future<void> _checkLoginState() async {
    final isLoggedIn = await _authService.isLoggedIn();
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

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
        return ProfilePage(onNavigate: _navigateTo);
      case 'settings':
        return const SettingsPage();
      case 'feed':
        return const FeedPage();
      default:
        return const FeedPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            color: Colors.transparent,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Menu and profile buttons in a row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Left side - Menu button
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                showMenu(
                                  context: context,
                                  position: RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
                                  color: const Color(0xFF03045E),
                                  items: [
                                    PopupMenuItem<String>(
                                      value: 'feed',
                                      child: Row(
                                        children: [
                                          const Icon(Icons.directions_boat_outlined, color: Colors.white),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Dive',
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                  ],
                                  elevation: 8.0,
                                ).then((value) {
                                  if (value != null) {
                                    _navigateTo(value);
                                  }
                                });
                              },
                            ),
                          ),
                          // Logo in center
                          Expanded(
                            child: Center(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => _navigateTo('feed'),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      height: 35,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Right side - Profile icon/button
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.person_outline,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () => _navigateTo('profile'),
                              tooltip: '@sarah_w',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Material(
          type: MaterialType.transparency,
          child: _buildPage(),
        ),
      ),
    );
  }
}
