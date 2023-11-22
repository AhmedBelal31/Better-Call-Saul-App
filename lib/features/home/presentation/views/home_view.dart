import 'package:better_call_saul_app/core/utils/constants/My_Colors.dart';
import 'package:better_call_saul_app/core/utils/styles.dart';
import 'package:better_call_saul_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:better_call_saul_app/features/home/presentation/view_models/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../../../core/utils/widgets/no_internet.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      // listener: (context, state) {
      //   // TODO: implement listener
      // },
      builder: (context, state) {
        return Scaffold(
          appBar: HomeCubit.get(context).isSearching
              ? appBarWithTextField(context)
              : customAppBarWithTitle(context),
          body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return const HomeViewBody();
              } else {
                return const NoInternet();
              }
            },
            child: const CustomLoadingIndicator(),
          ),
        );
      },
    );
  }

  AppBar appBarWithTextField(context) {
    return AppBar(
      backgroundColor: MyColors.myYellow,
      leading: HomeCubit.get(context).isSearching
          ? const BackButton(color: MyColors.myGrey)
          : Container(),
      title: TextField(
        controller: HomeCubit.get(context).textFieldSearchController,
        onChanged: (searchQuery) {
          HomeCubit.get(context).getAllCharacters(searchQuery);
        },
        decoration: InputDecoration(
          hintText: 'Find a character...',
          hintStyle: Styles.textStyle18.copyWith(color: MyColors.myGrey),
          border: InputBorder.none,
        ),
        style: Styles.textStyle18.copyWith(color: MyColors.myGrey),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: MyColors.myGrey,
          ),
        ),
      ],
    );
  }

  AppBar customAppBarWithTitle(context) {
    return AppBar(
      title: Text('Characters ',
          style: Styles.textStyle20
              .copyWith(color: MyColors.myGrey, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
          onPressed: () {
            HomeCubit.get(context).onSearchIconClicked(context);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: MyColors.myGrey,
          ),
        ),
      ],
    );
  }
}

// class CustomAppBarWithTitle extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBarWithTitle({Key? key}) : super(key: key);
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: MyColors.myYellow,
//       title:Text('Characters ', style: Styles.textStyle24.copyWith(color: MyColors.myGrey)),
//     );
//   }
// }
//
// class AppBarWithTextField extends StatelessWidget implements PreferredSizeWidget {
//   const AppBarWithTextField({Key? key}) : super(key: key);
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
