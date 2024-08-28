import 'package:flowers/view/splash/splash_veiw.dart';
import 'package:flowers/view_models/homescreen/homescreen_cubit.dart';
import 'package:flowers/view_models/product_details_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenCubit>(create: (context) => HomeScreenCubit()),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        darkTheme: ThemeData.dark(),
        home: const SplashView(),
      ),
    );
  }
}
