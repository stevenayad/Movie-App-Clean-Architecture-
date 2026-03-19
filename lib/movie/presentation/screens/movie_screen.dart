import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/servers/serversloctor.dart';
import 'package:movie_app/core/utils/contast.dart';
import 'package:movie_app/core/utils/dumy.dart';
import 'package:movie_app/movie/presentation/controller/movie/movie_bloc.dart';
import 'package:movie_app/movie/presentation/widget/nowplayingmovie.dart'
    show Nowplayingmovie;
import 'package:movie_app/movie/presentation/widget/popular_moving.dart';
import 'package:movie_app/movie/presentation/widget/section_header.dart';
import 'package:movie_app/movie/presentation/widget/top_realted_movie.dart';
import 'package:shimmer/shimmer.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRealtedMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Nowplayingmovie(),
              SectionHeader(title: "Popular", onSeeMore: () {}),
              PopularMoving(),
              SectionHeader(title: "Top Reated", onSeeMore: () {}),
              TopRealtedMovie(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
