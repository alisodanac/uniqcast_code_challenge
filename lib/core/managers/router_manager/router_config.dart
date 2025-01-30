
import 'package:go_router/go_router.dart';
import 'package:uniqcast_code_challenge/core/managers/router_manager/app_routes.dart';
import 'package:uniqcast_code_challenge/features/channels/presentation/pages/channels_page.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.channelsRoute ,
      builder: (context, state) =>const ChannelsPage(),
    ),
  ],
);