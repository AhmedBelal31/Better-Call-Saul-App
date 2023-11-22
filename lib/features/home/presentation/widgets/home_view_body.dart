import 'package:better_call_saul_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:better_call_saul_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:better_call_saul_app/features/home/presentation/view_models/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import 'characters_grid_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getCharacters();
    BlocProvider.of<HomeCubit>(context).getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (HomeCubit.get(context).textFieldSearchController.text.isNotEmpty ==
                true &&
            HomeCubit.get(context).searchedCharacters.isEmpty) {
          return Center(child: Lottie.asset('assets/images/no-data.json'));
        }
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  if (state is! GetCharactersErrorState)
                    CharactersGridView(
                      charactersModel: HomeCubit.get(context).allCharacters,
                    ),
                  if (state is GetCharactersErrorState)
                    const CustomErrorMessage(),
                  if (state is GetCharactersLoadingState)
                    const CustomLoadingIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
