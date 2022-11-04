import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/space_x_fly/presentation/space_x_view.dart';
import 'features/space_x_fly/repository/space_x_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => SpaceXRepository(),
        child: const SpaceXView(),
      ),
    );
  }
}
