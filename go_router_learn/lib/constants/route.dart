import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/view/details_page/view/details_page.dart';
import 'package:go_router_learn/view/home_page/view/home_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: "Home Page",
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: "Details Page",
      path: '/details/:detailId',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailsPage(id: state.params['detailId'].toString()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      // builder: (context, state) =>
      //
    )
  ],
);
