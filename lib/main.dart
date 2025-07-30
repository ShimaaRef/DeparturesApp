import 'package:departures_app/shared/dls/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/departures/presentation/bloc/departure_bloc.dart';
import 'features/departures/presentation/pages/home_page.dart';
import 'shared/di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const DepartureApp());
}

class DepartureApp extends StatelessWidget {
  const DepartureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BVG Departures',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: BlocProvider(
        create: (_) => di.sl<DepartureBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
