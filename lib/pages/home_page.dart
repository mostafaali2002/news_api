import 'package:flutter/material.dart';
import 'package:news_api/data/api/news_api.dart';
import 'package:news_api/data/models/articles_model.dart';
import 'package:news_api/widgets/image_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877F2),
        title: Text('News App', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: NewsApi.getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Try again.there is an error");
          } else if (snapshot.hasData) {
            List<ArticlesModel> articles = snapshot.data?.articles ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return ImageItemWidget(
                  image: articles[index].imageUrl ?? dummyImage,
                  title: articles[index].title ?? "",
                  onTap: () {
                    // Handle item tap
                  },
                );
              },
              itemCount: articles.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';
