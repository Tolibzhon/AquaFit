import 'package:aqua_fit/feature/auth/splash_screen.dart';
import 'package:aqua_fit/feature/saved/logic/cubits/get_workout_hive_cubit/get_workout_hive_cubit.dart';
import 'package:aqua_fit/feature/saved/logic/model/workout_hive_model.dart';
import 'package:aqua_fit/feature/saved/logic/repositories/workout_repo.dart';
import 'package:aqua_fit/feature/widgets/buttom_navigator.dart';
import 'package:aqua_fit/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(
    WorkoutHiveModelAdapter(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWorkoutHiveCubit(WorkoutHiveRepoImpl()),
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldKey,
        debugShowCheckedModeBanner: false,
        title: 'Aqua Fit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        home: const BottomNavigatorScreen() //SplashScreen(),//BottomNavigatorScreen()
      ),
    );
  }
}
