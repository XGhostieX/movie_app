import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../views_model/cast_cubit/cast_cubit.dart';

class CastListview extends StatelessWidget {
  const CastListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CastSuccess) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              itemCount: state.cast.length,
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
                            Assets.baseImageUrl +
                            state.cast[index].profilePath!,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    state.cast[index].name!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    state.cast[index].character!,
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
        } else if (state is CastFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
