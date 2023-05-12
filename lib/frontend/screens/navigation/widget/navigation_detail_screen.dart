import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mountainsquad_app/frontend/screens/favorites/widget/favorites_viewmodel.dart';
import '../../landing/widget/landing_viewmodel.dart';

class GetNavigation extends StatelessWidget {
  const GetNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',

      getPages: [
        GetPage(name: '/', page: () => const GetHome()),
        GetPage(name: '/favorites', page: () => const GetFavorites())
      ],
    );
  }
}