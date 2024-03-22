import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsapp/utils/utils.dart';


class DetailScreen extends StatefulWidget {
  final String title, description,time;

  const DetailScreen({Key? key, required this.title, required this.description, required this.time}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                child: SizedBox(
                  height: height * 0.4,
                  child: Image.asset(
                    "assets/corousel_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                left: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 20,),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(CupertinoIcons.arrowshape_turn_up_right_fill, size: 20,),
                          color: Colors.white,
                          onPressed: () {
                            // Handle favorite button tap
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.bookmark, size: 20,),
                          color: Colors.white,
                          onPressed: () {
                            // Handle favorite button tap
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Utils.getTimeAgo(widget.time.toString()),style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,fontSize: 15,height: 0,color: Colors.white
                    ),),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.mode_comment_rounded, size: 20,),
                              color: Colors.white,
                              onPressed: () {
                                // Handle favorite button tap
                              },
                            ),
                            Text("27",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w400,fontSize: 15,height: 0,color: Colors.white
                            ),),
                          ],
                        ),
                        Row( mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_red_eye_rounded, size: 20,),
                              color: Colors.white,
                              onPressed: () {
                                // Handle favorite button tap
                              },
                            ),
                            Text("916",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w400,fontSize: 15,height: 0,color: Colors.white
                            ),),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 4.0, color: Colors.orange),
                ),
              ),
              child: Text(widget.title.toString(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,fontSize: 20,height: 0,
                ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
            child:Text(widget.description.toString(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,fontSize: 15,height: 0,
            ),),
          )
        ],
      ),
    );
  }
}


