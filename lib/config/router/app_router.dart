// lib\config\router\app_router.dart

import 'package:cinemapedia/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';


final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/', //ruta raiz donde esta el home
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
