import 'package:fast_pay/blocs/cards/cards_bloc.dart';
import 'package:fast_pay/data/repositories/cards_reopository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/cards/cards_event.dart';
import '../blocs/connectivity/connectivity_bloc.dart';
import '../blocs/user_profile/user_profile_bloc.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/user_profile_repository.dart';
import '../screens/routes.dart';
import '../services/local_notification_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    // Initialize local notification service
    LocalNotificationService.localNotificationService.init(navigatorKey);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => UserProfileRepository()),
        RepositoryProvider(create: (_) => CardsRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ConnectivityBloc()),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(CheckAuthenticationEvent()),
          ),
          BlocProvider(
            create: (context) => UserProfileBloc(
              context.read<UserProfileRepository>()
            ),
          ),
          BlocProvider(
            create: (context) => UserCardsBloc(
              cardsRepository: context.read<CardsRepository>(),
            )
              ..add(GetCardsDatabaseEvent())
              ..add(GetActiveCards()),
          ),
        ],
        child: MaterialApp(
          // theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splashScreen,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
