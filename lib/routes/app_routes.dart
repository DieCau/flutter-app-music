import 'package:go_router/go_router.dart';

import 'package:app_music/features/artist/ui/screen/artist_screen.dart';
import 'package:app_music/features/home/ui/screen/home_screen.dart';
import 'package:app_music/features/playlist/ui/screen/playlist_screen.dart';
import 'package:app_music/features/splash/ui/splash_screen.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: SplashScreen.name,
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: HomeScreen.name,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              name: PlaysListScreen.name,
              path: PlaysListScreen.name,
              builder: (context, state) {
                final id = int.parse(state.extra.toString());
                return PlaysListScreen(id: id);
              },
            ),
            GoRoute(
              name: ArtistScreen.name,
              path: ArtistScreen.name,
              builder: (context, state) {
                return const ArtistScreen();
              },
            ),
          ],
        )
      ],
    ),
  ],
);
