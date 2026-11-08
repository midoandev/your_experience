import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:your_experience/core/ui/tokens/app_duration.dart';
import 'package:your_experience/features/home/view/home_page.dart';
import 'package:your_experience/features/not_found/view/not_found_page.dart';
import 'package:your_experience/features/portfolio_detail/view/portfolio_detail_page.dart';

CustomTransitionPage<void> _fade(GoRouterState state, Widget child) =>
    CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: AppDuration.fast,
      reverseTransitionDuration: AppDuration.fast,
      transitionsBuilder: (_, animation, _, child) =>
          FadeTransition(opacity: animation, child: child),
    );

final appRouter = _buildRouter();

GoRouter _buildRouter() {
  // push()/pop() also update the browser URL, so project pages are
  // shareable while the home page keeps its scroll position on back.
  GoRouter.optionURLReflectsImperativeAPIs = true;

  return GoRouter(
    initialLocation: '/',
    errorPageBuilder: (_, state) => _fade(state, const NotFoundPage()),
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (_, state) => _fade(state, const HomePage()),
      ),
      // Deep-linkable: /project/torcons survives refresh and sharing.
      GoRoute(
        path: '/project/:id',
        name: 'portfolio-detail',
        pageBuilder: (_, state) => _fade(
          state,
          PortfolioDetailPage(id: state.pathParameters['id'] ?? ''),
        ),
      ),
      // Legacy URL from the previous version (data lived in `extra`).
      GoRoute(path: '/portfolio-detail', redirect: (_, _) => '/'),
    ],
  );
}
