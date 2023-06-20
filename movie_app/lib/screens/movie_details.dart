import 'package:flutter/material.dart';
import 'package:movie_app/components/custom_button.dart';
import 'package:movie_app/components/custom_text.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/size_config.dart';
import 'package:movie_app/utils/util_functions.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails(
      {super.key,
      required this.poster,
      required this.title,
      required this.year});

  final String poster;
  final String title;
  final String year;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SizedBox(
          width: SizeConfig.w(context),
          height: SizeConfig.h(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: SizeConfig.w(context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.poster), fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: CircleAvatar(
                        backgroundColor: AppColors.white.withOpacity(.7),
                        child: IconButton(
                            onPressed: () => UtilFunctions.goBack(context),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.black,
                              size: 20,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.w(context) * 0.7,
                      child: CustomText(
                        widget.title,
                        color: AppColors.white,
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.cloud_download,
                          color: AppColors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CustomText(
                      'Drama, Fiction',
                      color: Color.fromARGB(255, 109, 109, 109),
                      fontSize: 12,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CustomText(
                      widget.year,
                      color: const Color.fromARGB(255, 120, 120, 120),
                      fontSize: 13,
                    ),
                    const SizedBox(width: 20),
                    const CustomText(
                      '2h 49m',
                      color: Color.fromARGB(255, 125, 125, 125),
                      fontSize: 13,
                    ),
                    const SizedBox(width: 10),
                    const CustomText(
                      'HD',
                      color: Color.fromARGB(255, 128, 128, 128),
                      fontSize: 13,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                  text: 'Watch now',
                  iconData: Icons.play_arrow,
                  onTap: () {},
                  color: const Color.fromARGB(255, 123, 123, 123),
                  textColor: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  radius: 100,
                  width: SizeConfig.w(context),
                  height: 40,
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomText(
                  'Prolog',
                  color: AppColors.ashBorder,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomText(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop.',
                  color: Color.fromARGB(255, 111, 111, 111),
                  fontSize: 11,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
