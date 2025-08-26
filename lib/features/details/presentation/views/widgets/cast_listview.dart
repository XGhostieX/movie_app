import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubit/generic_cubit.dart';
import '../../../../../core/models/cast.dart';
import '../../../../../core/utils/api_url.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/cast_shimmer_skeleton.dart';
import '../../../data/repos/details_repo.dart';

class CastListview extends StatelessWidget {
  final String endPoint;
  const CastListview({super.key, required this.endPoint});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericCubit()
        ..fetchData<List<Cast>>(
          getIt.get<DetailsRepo>().fetchCast('$endPoint/credits'),
        ),
      child: BlocBuilder<GenericCubit, GenericState>(
        builder: (context, state) {
          if (state is GenericLoading) {
            return const CastShimmerSkeleton();
          } else if (state is GenericSuccess) {
            return SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: state.data.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          // height: 100,
                          // width: 100,
                          imageUrl:
                              ApiUrl.baseImageUrl +
                              state.data[index].profilePath!,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error_rounded),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.data[index].name!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      state.data[index].character!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GenericFailure) {
            return Center(child: Text(state.errMsg));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
