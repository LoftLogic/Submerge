import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;
  double distance = 10;
  String language = 'english';
  final _authService = AuthService();

  ButtonStyle get _buttonStyle => TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    backgroundColor: Colors.white.withOpacity(0.1),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: Colors.white.withOpacity(0.2),
      ),
    ),
  );

  ButtonStyle get _dangerButtonStyle => TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    backgroundColor: Colors.white.withOpacity(0.1),
    foregroundColor: Theme.of(context).colorScheme.error,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: Theme.of(context).colorScheme.error.withOpacity(0.3),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Account Settings
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: _buttonStyle,
                          child: const Text('Change Email'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: _buttonStyle,
                          child: const Text('Change Password'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Preferences
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Preferences',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Notifications',
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: notifications,
                          onChanged: (value) => setState(() => notifications = value),
                          activeColor: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dark Mode',
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: darkMode,
                          onChanged: (value) => setState(() => darkMode = value),
                          activeColor: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Maximum Distance',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Slider(
                                value: distance,
                                min: 1,
                                max: 100,
                                activeColor: Theme.of(context).colorScheme.secondary,
                                onChanged: (value) => setState(() => distance = value),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                '${distance.round()} mi',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Language',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: DropdownButton<String>(
                            value: language,
                            dropdownColor: Theme.of(context).colorScheme.background,
                            style: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            underline: Container(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() => language = newValue);
                              }
                            },
                            items: [
                              'english',
                              'spanish',
                              'french',
                              'german',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value[0].toUpperCase() + value.substring(1),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Privacy
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Privacy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Profile Visibility',
                          style: TextStyle(color: Colors.white),
                        ),
                        DropdownButton<String>(
                          value: 'everyone',
                          dropdownColor: const Color(0xFF03045E),
                          style: const TextStyle(color: Colors.white),
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                          underline: Container(
                            height: 2,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          onChanged: (String? newValue) {},
                          items: [
                            'everyone',
                            'matches',
                            'nobody',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value[0].toUpperCase() + value.substring(1),
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Support
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Support',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: _buttonStyle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.help_outline),
                                SizedBox(width: 8),
                                Text('Contact Support'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {},
                            style: _buttonStyle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.question_answer_outlined),
                                SizedBox(width: 8),
                                Text('FAQ'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () async {
                              await _authService.logout();
                              if (mounted) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (route) => false,
                                );
                              }
                            },
                            style: _dangerButtonStyle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.logout),
                                SizedBox(width: 8),
                                Text('Log Out'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 