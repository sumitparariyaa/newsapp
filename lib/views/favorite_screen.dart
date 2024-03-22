import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/bookmarkProvider.dart';
import '../utils/utils.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final articles = provider.articles;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite Screen'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.03),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.07,
                              top: height * 0.03,
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(
                                right: 20,
                                top: 10,
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: width * 0.05),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: width * 0.57,
                                        child: Text(
                                          articles[index],
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.03),
                                      Row(
                                        children: [
                                          Text(
                                            Utils.getTimeAgo(DateTime.now()
                                                .toString()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: width * 0.2),
                                          IconButton(
                                            onPressed: () {
                                              provider.toggleFavorite(
                                                articles[index],
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.bookmark,
                                              color: Colors.orange,
                                              size: 20,
                                            ),
                                          )
                                        ],
                                      )
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
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://via.placeholder.com/150',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}