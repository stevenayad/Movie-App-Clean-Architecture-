import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/contast.dart';
import 'package:movie_app/core/utils/dumy.dart';
import 'package:movie_app/core/utils/enms.dart';
import 'package:movie_app/movie/presentation/controller/movie/movie_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TopRealtedMovie extends StatelessWidget {
  const TopRealtedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (pervious, current) =>
          pervious.topratedState != current.topratedState,
      builder: (context, state) {
        print('Build Top Rated');
        switch (state.topratedState) {
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topratedMovies.length,
                  itemBuilder: (context, index) {
                    print(state.topratedMovies.length);
                    final movie = state.topratedMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: Constant.imageurl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.loading:
            return SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Center(child: Text(state.topratedplayingmessage)),
            );
        }
      },
    );
  }
}
