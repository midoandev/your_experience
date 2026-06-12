import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/features/home/view/home_page.dart';
import 'package:your_experience/features/portfolio_detail/view/portfolio_detail_page.dart';
import 'package:your_experience/features/projects_list/view/projects_page.dart';
import 'package:your_experience/features/splash/view/splash_page.dart';
import 'package:your_experience/models/projects_data.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'splash', builder: (_, _) => const SplashPage()),
    GoRoute(
      path: '/main',
      name: 'home',
      pageBuilder: (_, _) => const NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      path: '/portfolio-detail',
      name: 'portfolio-detail',
      builder: (_, state) {
        final data = state.extra;
        if (data is! ProjectsData) return const SizedBox.shrink();
        return PortfolioDetailPage(data: data);
      },
    ),
    GoRoute(
      path: '/projects',
      name: 'projects',
      builder: (_, _) => const ProjectsPage(),
    ),
  ],
);
