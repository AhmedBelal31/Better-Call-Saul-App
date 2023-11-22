import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/constants/My_Colors.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/view_models/home_cubit/home_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setup();
  runApp(const BetterCallSaulApp());
}

class BetterCallSaulApp extends StatelessWidget {
  const BetterCallSaulApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Better Call Saul',
        theme: ThemeData.dark().copyWith(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          scaffoldBackgroundColor: MyColors.myGrey,
          appBarTheme: const AppBarTheme(
              backgroundColor: MyColors.myYellow,
              iconTheme: IconThemeData(color: MyColors.myGrey)
              // systemOverlayStyle: SystemUiOverlayStyle(
              //   statusBarIconBrightness: Brightness.light,
              //   statusBarColor: MyColors.myGrey,
              // )
              ),
        ),
        debugShowCheckedModeBanner: false,
        //home: const HomeView(),
        initialRoute: AppRouter.splashView,
        routes: AppRouter.routes,
      ),
    );
  }
}
