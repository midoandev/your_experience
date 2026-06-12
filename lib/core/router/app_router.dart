import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/features/home/view/home_page.dart';
import 'package:your_experience/features/portfolio_detail/view/portfolio_detail_page.dart';
import 'package:your_experience/features/splash/view/splash_page.dart';

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
        if (data == null) return const SizedBox();
        return PortfolioDetailPage(data: data);
      },
    ),
  ],
);
