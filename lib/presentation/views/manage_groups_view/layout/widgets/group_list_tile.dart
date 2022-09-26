import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../configurations/front_end.dart';
import '../../../../elements/custom_text.dart';

class GroupListTile extends StatelessWidget {
  const GroupListTile(
      {Key? key,
      required this.onTap,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.totalMembers})
      : super(key: key);
  final VoidCallback onTap;
  final String imagePath;
  final String title;
  final String description;
  final String totalMembers;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imagePath,
              height: 60,
              width: 60,
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: 30,
                  backgroundColor: FrontEndConfigs.kWhiteColor,
                  backgroundImage: imageProvider,
                );
              },
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
                size: 20,
              ),
            ),
            title: CustomText(
              text: '$title ($totalMembers)',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textColor: FrontEndConfigs.kSecondaryColor,
            ),
            subtitle: CustomText(
                text: description,
                fontSize: 10,
                maxLines: 2,
                textColor: const Color(0xff707070),
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
              height: 0,
              thickness: 1,
              color: FrontEndConfigs.kBlackColor.withOpacity(0.1))
        ],
      ),
    );
  }
}
