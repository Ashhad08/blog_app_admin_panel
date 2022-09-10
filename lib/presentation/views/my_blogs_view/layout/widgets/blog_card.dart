import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.onDelete})
      : super(key: key);
  final String imagePath;
  final String title;
  final String description;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: FrontEndConfigs.kWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: PopupMenuButton(
                onSelected: (int val) => onDelete(val),
                splashRadius: 20,
                icon: const Icon(
                  Icons.more_vert_rounded,
                  size: 23,
                  color: FrontEndConfigs.kBlackColor,
                ),
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          value: 0,
                          child: CustomText(
                              text: 'Edit Post',
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                      const PopupMenuItem(
                          value: 1,
                          child: CustomText(
                              text: 'Delete Post',
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ]),
          ),
          imagePath.isNotEmpty || imagePath != null
              ? Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 2,
                            color:
                                FrontEndConfigs.kBlackColor.withOpacity(0.3)),
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      height: 209,
                      fit: BoxFit.cover,
                      imageUrl: imagePath,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  color: FrontEndConfigs.kWhiteColor,
                  height: 209,
                  child: const Center(
                    child: CustomText(
                      text: 'No image',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: FrontEndConfigs.kSecondaryColor,
                    ),
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: FrontEndConfigs.kSecondaryColor,
                ),
                CustomText(
                  text: description,
                  fontSize: 12,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                  textColor: const Color(0xffB4B2B2),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: FrontEndConfigs.kPrimaryColor,
                ),
              ),
              const CustomText(
                  text: '24 likes', fontSize: 12, fontWeight: FontWeight.w400),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.chat_bubble_fill,
                  color: FrontEndConfigs.kSecondaryColor,
                ),
              ),
              const CustomText(
                  text: '10 Comments',
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: FrontEndConfigs.kSecondaryColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
