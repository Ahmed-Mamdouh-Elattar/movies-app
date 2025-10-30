import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/networking/network_info/network_cubit/network_cubit.dart';

import 'package:movies_app/features/show_movies/presentation/widgets/home_page/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, NetworkState>(
      listener: (context, state) async {
        if (state is NetworkDisconnected) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const AlertDialog(
              title: Text('No Internet Connection'),
              content: Text('Please check your connection and try again.'),
            ),
          );
        }
        if (state is NetWorkConnected) {
          context.canPop() ? context.pop() : null;
        }
      },
      child: const SafeArea(child: HomePageBody()),
    );
  }
}
