import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/all_news_model.dart';
import '../states/bookmarkProvider.dart';
import '../states/carousel_provider.dart';
import '../utils/utils.dart';
import '../viewmodel/all_news_provider.dart';
import '../widgets/custom_indicator.dart';
import '../widgets/custom_tabbar.dart';
import 'Details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'assets/corousel_image.jpg',
    'assets/corousel_image.jpg',
    'assets/corousel_image.jpg',
    'assets/corousel_image.jpg',
    'assets/corousel_image.jpg',
  ];

  late Future<AllNewsModel?> _newsFuture;
  late NewsViewModel _newsViewModel;

  @override
  void initState() {
    super.initState();
    _newsViewModel = NewsViewModel();
    _newsFuture = _newsViewModel.allNewsPost();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(color: Colors.orange),
              child: Text(
                "OXU",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 0,
                      color: Colors.white,
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(color: Colors.black),
              child: Text(
                "AZ",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 0,
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder<AllNewsModel?>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.orange));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTabBar(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Consumer<CarouselProvider>(
                    builder: (context, value, child) {
                      return CarouselSlider.builder(
                        itemCount: images.length,
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.25,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            context.read<CarouselProvider>().setIndex(index);
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    title: snapshot.data!.articles![index].title
                                        .toString(),
                                    description: snapshot
                                        .data!.articles![index].description
                                        .toString(),
                                    time: snapshot
                                        .data!.articles![index].publishedAt
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      images[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                Positioned(
                                  bottom: 18,
                                  left: 10,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: Text(
                                      snapshot.data!.articles![index].title
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 20,
                                            height: 0,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 10,
                                  left: 15,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Utils.getTimeAgo(snapshot
                                            .data!.articles![index].publishedAt
                                            .toString()),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              height: 0,
                                              color: Colors.white,
                                            ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.bookmark,
                                          size: 20,
                                        ),
                                        color: Colors.white,
                                        onPressed: () {
                                          provider.toggleFavorite(
                                            snapshot.data!.articles![index].title!,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                  const CustomIndicator(
                    length: 5,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Latest News',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: snapshot.data!.articles!.length,
                            itemBuilder: (context, index) {
                              return SingleChildScrollView(
                                physics: const ClampingScrollPhysics(),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              title: snapshot.data!.articles![index].title
                                                  .toString(),
                                              description: snapshot
                                                  .data!.articles![index].description
                                                  .toString(),
                                              time: snapshot
                                                  .data!.articles![index].publishedAt
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.07,
                                                top: height * 0.03),
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 20, top: 10, bottom: 5),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(width: width * 0.05),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        width: width * 0.57,
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .articles![index]
                                                              .title
                                                              .toString(),
                                                          maxLines: 2,
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge
                                                              ?.copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: height * 0.03),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            Utils.getTimeAgo(
                                                                snapshot
                                                                    .data!
                                                                    .articles![
                                                                        index]
                                                                    .publishedAt
                                                                    .toString()),
                                                            style:
                                                                Theme.of(context)
                                                                    .textTheme
                                                                    .bodyMedium
                                                                    ?.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                          ),
                                                          SizedBox(
                                                              width: width * 0.2),
                                                          IconButton(
                                                            onPressed: () {
                                                              provider.toggleFavorite(snapshot.data!.articles![index].title!);
                                                            },
                                                            icon: Icon(
                                                              Icons.bookmark,
                                                              color: provider.isExist(snapshot.data!.articles![index].title!)
                                                                  ? Colors.orange
                                                                  : Colors.grey,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.28,
                                            height: height * 0.152,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                snapshot.data!.articles![index]
                                                    .urlToImage
                                                    .toString(),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height * 0.03),
                                    if (index ==
                                        snapshot.data!.articles!.length - 1)
                                      SizedBox(height: height * 0.66),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
