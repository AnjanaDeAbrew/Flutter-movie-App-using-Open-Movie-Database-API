import 'package:flutter/material.dart';
import 'package:movie_app/components/custom_text.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices client = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: SizeConfig.w(context),
          height: SizeConfig.h(context),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJzI8ssBFPVXkeOkmcjICIBOzX3dJf8Undxi0ixAsi_CciCXHhVjMc1LggcEkJvS10BGE&usqp=CAU'),
                    ),
                    SizedBox(width: 20),
                    CustomText(
                      'Theater Pro',
                      color: AppColors.white,
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 228, 228, 228),
                      child: Icon(
                        Icons.search,
                        color: AppColors.black,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              FutureBuilder(
                future: client.getArticle(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Search>> snapshot) {
                  if (snapshot.hasData) {
                    List<Search>? movies = snapshot.data;

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          itemCount: movies!.length,
                          itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetails(
                                            poster:
                                                movies[index].poster.toString(),
                                            title:
                                                movies[index].title.toString(),
                                            year: movies[index].year.toString(),
                                          )),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              movies[index].poster.toString()),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  CustomText(
                                    movies[index].title.toString(),
                                    color: AppColors.white,
                                    fontSize: 12,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  CustomText(
                                    movies[index].year.toString(),
                                    color: AppColors.ashBorder,
                                    fontSize: 12,
                                  )
                                ],
                              )

                              // Container(
                              //   height: 200,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(15),
                              //     color: AppColors.lightBlue,
                              //     image: DecorationImage(
                              //         image: NetworkImage(
                              //             movies[index].poster.toString()),
                              //         fit: BoxFit.cover),
                              //   ),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       CustomText(
                              //         movies[index].title.toString(),
                              //         color: AppColors.white,
                              //         fontSize: 14,
                              //         textOverflow: TextOverflow.ellipsis,
                              //       ),
                              //       CustomText(
                              //         movies[index].year.toString(),
                              //         color: AppColors.ashBorder,
                              //         fontSize: 13,
                              //       )
                              //     ],
                              //   ),
                              // ),
                              ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 35,
                          ),
                        ),
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
