import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/basic_appbar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(Assets.logo),
        action: IconButton(
          onPressed: () => GoRouter.of(context).push(AppRouter.kSearchView),
          icon: const Icon(Icons.search_rounded),
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
