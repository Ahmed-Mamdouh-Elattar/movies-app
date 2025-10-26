import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/enums/movie_category_enum.dart';
import 'package:movies_app/core/networking/network_info/network_cubit/network_cubit.dart';

import 'package:movies_app/features/show_movies/presentation/managers/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/show_movies/presentation/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, NetworkState>(
      listener: (context, state) {
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
          context.read<MoviesCubit>().getMoviesByCategory(
            category: MovieCategory.topRated.value,
          );
        }
      },
      child: const SafeArea(child: HomePageBody()),
    );
  }
}
// 'https://picsum.photos/seed/${key}_$index/200/300',
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:movies_app/core/networking/network_info/network_cubit/network_cubit.dart';
// import 'package:movies_app/core/networking/network_info/network_info.dart';
// import 'package:movies_app/core/services/service_locator.dart';
// import 'package:movies_app/core/widgets/modal_progress_hud.dart';
// import 'package:movies_app/features/show_movies/presentation/widgets/home_page_body.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NetworkCubit, NetworkState>(
//       listener: (context, state) {
        
//       },
//       builder: (context, state) {
//         if (state is NetworkDisconnected) {
//           showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (_) => BlocBuilder<NetworkCubit, NetworkState>(
//               builder: (context, state) {
//                 return Stack(
//                   children: [
//                     if (state is Loading) const ModalProgressHud(),
//                     AlertDialog(
//                       title: const Text('No Internet Connection'),
//                       content: const Text(
//                         'Please check your connection and try again.',
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () async {
//                             await context
//                                 .read<NetworkCubit>()
//                                 .checkConnection();
//                           },
//                           child: const Text('Try'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//             ),
//           );
//         }
//       },
//       child: const SafeArea(child: HomePageBody()),
//     );
//   }
// }
// // 'https://picsum.photos/seed/${key}_$index/200/300',