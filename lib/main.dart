import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_counter_app/data/themes/app_theme.dart';
import 'package:simple_counter_app/logic/cubit/counter_cubit.dart';
import 'package:simple_counter_app/view/pages/home_page.dart';

void main() => runApp(const Counter());

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => CounterCubit()))],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'Counter App',
        home: const HomePage(),
      ),
    );
  }
}
