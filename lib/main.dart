import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as pro;
import 'package:resume_clone/main_screen.dart';
import 'package:resume_clone/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return pro.ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
          theme: pro.Provider.of<ThemeProvider>(context).baseTheme,
        );
      },
    );
  }
}
