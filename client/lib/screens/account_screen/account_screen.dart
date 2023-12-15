import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/components/avatar.dart';
import 'package:social_media_with_chatgpt/shared/utils/app_colors.dart';
import 'package:social_media_with_chatgpt/shared/widgets/text/app_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildTop(maxWidth, maxHeight),
          buildContent(maxWidth),
        ],
      ),
    );
  }

  Widget buildContent(double width) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 67, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Username",
            fontSize: 20,
            color: AppColors.darkgreen,
            fontWeight: FontWeight.bold,
          ),
          Text("Capybara Photographer"),
          Container(
            child: Row(
              children: [
                AppText(
                  "280 ",
                  fontSize: 15,
                  color: AppColors.green,
                ),
                Text("Friend")
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                AppText(
                  "10,000 ",
                  fontSize: 15,
                  color: AppColors.green,
                ),
                Text("Follower")
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                AppText(
                  "87 ",
                  fontSize: 15,
                  color: AppColors.green,
                ),
                Text("Following")
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 4, color: Colors.black26),
              ),
              color: Colors.white,
            ),
            child: Row(),
          ),
          Column(
            children:
                [1, 2, 3, 4, 5].map((e) => _buildPostContainer()).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildPostContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Avatar.medium(
                imageUrl:
                    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg", // Replace with the actual avatar URL
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ilovecat123", // Replace with the actual user name
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "11:26PM 12/7/2003", // Replace with the actual date and time
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Post content goes here. This can be a long text, an image, or any other content.",
          ),
          Image(
              image: NetworkImage(
                  "https://www.rainforest-alliance.org/wp-content/uploads/2021/06/capybara-square-1.jpg.optimal.jpg"))
          // Add any other widgets for post content (e.g., images)
        ],
      ),
    );
  }

  Widget buildTop(double maxWidth, double maxHeight) {
    return Stack(
      alignment: Alignment.topLeft,
      clipBehavior: Clip.none,
      children: [
        buildCoverImg(maxWidth, maxHeight),
        Positioned(
            top: (maxWidth / 3) - 67,
            child: Container(
                padding: EdgeInsets.all(8), child: buildProfileImg())),
      ],
    );
  }

  Widget buildCoverImg(double width, double height) => Container(
      color: Colors.grey,
      child: Image.network(
        'https://www.pbs.org/wnet/nature/files/2023/07/pexels-pixabay-160583-scaled-e1689259491194.jpg',
        width: width,
        height: width / 3,
        fit: BoxFit.cover,
      ));
  Widget buildProfileImg() => Container(
        child: Avatar.huge(
            imageUrl:
                'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
      );
}
