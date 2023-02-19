import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/view/home_page/cubit/home_cubit.dart';
import 'package:go_router_learn/view/home_page/model/home_page_model.dart';
import '../../../widgets/custom_error_widget.dart';
import '../../../widgets/custom_loading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => HomeCubit()..fetchData(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeError) {
              return CustomErrorWidget(errorText: state.errorText);
            } else if (state is HomeFetch) {
              return _buildBody(state);
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }

  ListView _buildBody(HomeFetch state) {
    return ListView.builder(
      itemCount: state.list?.length ?? 1,
      itemBuilder: (BuildContext context, int index) {
        HomePageModel? item = state.list?[index];
        return GestureDetector(
          onTap: () {
            context.go("/details/${item?.id}");
          },
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(item?.id.toString() ?? ""),
              ),
              title: Text(item?.title ?? ""),
            ),
          ),
        );
      },
    );
  }
}


