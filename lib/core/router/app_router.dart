import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/features/splash/view/splash_page.dart';
import 'package:your_experience/features/home/view/home_page.dart';
import 'package:your_experience/features/portfolio_detail/view/portfolio_detail_page.dart';
import 'package:your_experience/features/about/view/about_page.dart';
import 'package:your_experience/features/workspace/editor_content/view/editor_content_page.dart';
import 'package:your_experience/features/workspace/create_portfolio/view/create_portfolio_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'splash', builder: (_, __) => const SplashPage()),
    GoRoute(
      path: '/main',
      name: 'home',
      pageBuilder: (_, __) => const NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      path: '/portfolio-detail',
      name: 'portfolio-detail',
      builder: (_, state) {
        final data = state.extra;
        return PortfolioDetailPage(data: data);
      },
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (_, __) => const AboutPage(),
    ),
    GoRoute(
      path: '/edit-portfolio',
      name: 'editor-content',
      builder: (_, state) =>
          EditorContentPage(initialText: state.extra as String?),
    ),
    GoRoute(
      path: '/create-portfolio',
      name: 'create-portfolio',
      builder: (_, __) => const CreatePortfolioPage(),
    ),
  ],
);
