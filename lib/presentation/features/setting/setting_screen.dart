import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.mic_none), onPressed: () {}),
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionCard(
            title: 'Account',
            subtitle: 'Manage your account settings',
            children: [
              _SettingTile(
                icon: Icons.drive_folder_upload,
                iconColor: Colors.red[400],
                title: 'Sign in with Google Drive',
                subtitle: 'Connect your Google Drive for backup',
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: 'Security',
            subtitle: 'Protect your financial data',
            children: [
              _SettingTile(
                icon: Icons.shield_outlined,
                iconColor: Colors.amber[700],
                title: 'PIN Lock',
                subtitle: 'Require PIN to open app',
                trailing: Switch(value: false, onChanged: (v) {}),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: 'Appearance',
            subtitle: 'Customize your app experience',
            children: [
              _SettingTile(
                icon: Icons.brightness_4_outlined,
                iconColor: Colors.deepPurple[300],
                title: 'Theme',
                subtitle: 'Your preferred theme',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'System',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: 'Localization',
            subtitle: 'Language and currency preferences',
            children: [
              _SettingTile(
                icon: Icons.attach_money,
                iconColor: Colors.blue[400],
                title: 'Currency',
                subtitle: 'Currency for transactions',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('USD', style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      elevation: 1,
      color: theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.hintColor,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  const _SettingTile({
    required this.icon,
    this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: (iconColor ?? theme.primaryColor).withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: iconColor ?? theme.primaryColor, size: 28),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
