import 'package:flutter/material.dart';
import 'package:social_media_with_chatgpt/components/avatar.dart';
import 'package:social_media_with_chatgpt/shared/widgets/app_dismiss_keyboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      onWillPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        height: 60,
                      ),
                      Icon(Icons.search, size: 30),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Avatar.big(
                                      imageUrl:
                                          "https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/eb21ff53-8d0a-4075-ac78-bf86e017f211/width=450/00455-3080383954.jpeg",
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    flex: 3,
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your text here...',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildIconWithText(Icons.image, "Image"),
                                  _buildIconWithText(
                                      Icons.video_collection, "Video"),
                                  _buildIconWithText(Icons.file_copy, "File"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildStoryCircle(
                          "https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/plus-512.png",
                          "Add"),
                      _buildStoryCircle(
                          "https://images.theconversation.com/files/232705/original/file-20180820-30593-1nxanpj.jpg?ixlib=rb-1.1.0&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip",
                          "Duy Minh Truong"),
                      _buildStoryCircle(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7wtRL1f_19R_ctRH1udYnDWzZLp-Ad8K6_g&usqp=CAU",
                          "kaka123"),
                      _buildStoryCircle(
                          "https://cdn.pixabay.com/photo/2021/03/13/14/29/capybara-6091872_1280.jpg",
                          "hello mom"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      itemCount:
                          5, // Change this to the number of posts you want to display
                      itemBuilder: (context, index) {
                        return _buildPostContainer();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStoryCircle(String url, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(imageUrl: url),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        )
      ],
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
                    "https://hips.hearstapps.com/hmg-prod/images/neva-masquerade-royalty-free-image-1674509896.jpg?crop=0.8109xw:1xh;center,top&resize=1200:*", // Replace with the actual avatar URL
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

  Widget _buildIconWithText(IconData icon, String text) {
    return InkWell(
      onTap: () {
        print('$text tapped!');
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8.0),
          Text(text),
        ],
      ),
    );
  }
}
