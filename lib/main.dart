import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tasks_md/core/core.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp()
      )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {


      final router = ref.watch(goRouterProvider);



    return MaterialApp.router(
      routerConfig:router ,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
    );
  }
}
