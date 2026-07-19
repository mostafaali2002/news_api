import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/feature/pages/page_model/home_cubit_cubit.dart';
import 'package:news_api/feature/pages/repo/data_source/home_data_source_remote_inmplement.dart';
import 'package:news_api/feature/pages/repo/repo/home_repo_implement.dart';
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
    return BlocProvider<HomeCubit>(
      create: (context) =>
          HomeCubit(HomeRepoImplement(HomeDataSourceRemoteImplement()))
            ..fetchNews(),
      child: Scaffold(
        backgroundColor: Color(0xff202020),
        appBar: AppBar(
          backgroundColor: Color(0xff1877F2),
          title: Text('News App', style: Theme.of(context).textTheme.bodyLarge),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeCubitState>(
          builder: (context, state) {
            if (state is HomeCubitInitial) {
              return SizedBox();
            } else if (state is HomeCubitError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is HomeCubitLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeCubitSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ImageItemWidget(
                    image: state.articles[index].imageUrl ?? dummyImage,
                    title: state.articles[index].title ?? 'No Title',
                    onTap: () {},
                  );
                },
                itemCount: state.articles.length,
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';
