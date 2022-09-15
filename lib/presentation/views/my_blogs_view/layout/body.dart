import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/models/blog_model.dart';
import '../../../../backend/services/admin_services.dart';
import '../../../../backend/services/system_services.dart';
import '../../../../configurations/front_end.dart';
import '../../../elements/custom_text.dart';
import 'widgets/blog_card.dart';

class MyBlogsViewBody extends StatelessWidget {
  const MyBlogsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kScaffoldColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 44,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xffEBEBEB),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 21,
                      ),
                      Icon(
                        Icons.search_rounded,
                        size: 30,
                        color: Color(0xffB4B2B2),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CustomText(
                        text: 'Search by name',
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xffB4B2B2),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: StreamProvider.value(
              initialData: [BlogModel()],
              value: SystemServices().fetchMyBlogs(),
              builder: (context, child) {
                List<BlogModel> _myBlogsList = context.watch<List<BlogModel>>();
                if (_myBlogsList.isEmpty) {
                  return const SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Center(
                      child: CustomText(
                        text: 'NO Blogs Uploaded',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textColor: FrontEndConfigs.kPrimaryColor,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _myBlogsList.length,
                      itemBuilder: (context, index) {
                        return BlogCard(
                          imagePath: _myBlogsList[index].blogImage.toString(),
                          title: _myBlogsList[index].blogTitle.toString(),
                          description:
                              _myBlogsList[index].blogDescription.toString(),
                          onDelete: (val) {
                            if (val == 1) {
                              AdminServices().deleteBlog(
                                  blogId:
                                      _myBlogsList[index].blogId.toString());
                            }
                          },
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
