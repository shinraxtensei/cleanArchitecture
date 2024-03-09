import 'package:clean_architecture/features/cats/data/datasources/get_remote_cats.dart';
import 'package:clean_architecture/features/cats/data/repositories/cat_repository_imp.dart';
import 'package:clean_architecture/features/cats/domain/usecases/get_cats.dart';
import 'package:clean_architecture/features/cats/presentation/bloc/cats_bloc.dart';
import 'package:clean_architecture/features/cats/presentation/pages/cats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

// import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await di.init();

  // TODO : use the get_it service locator to inject the dependencies

  final httpClient = http.Client(); // Create instances
  final getRemoteCatsDataSource = GetRemoteCatsDataSource(httpClient);
  final catRepository = CatRepositoryImp(getRemoteCatsDataSource);
  final getCatsUseCase = GetCatsUseCase(catRepository);

  runApp(MyApp(
    bloc: CatsBloc(getCatsUseCase),
  ));
}

class MyApp extends StatefulWidget {
  static final GlobalKey<MyAppState> appKey = GlobalKey();
  final CatsBloc bloc;

  const MyApp({super.key, required this.bloc});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode _currentThemeMode = ThemeMode.light;
  String _currentLanguage = 'en';

  // ignore: unused_element
  void _toggleTheme() {
    setState(() {
      _currentThemeMode = (_currentThemeMode == ThemeMode.light)
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  // ignore: unused_element
  void _toggleLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // AppLocalizations.delegate,
      ],
      locale: Locale(_currentLanguage),
      supportedLocales: const [Locale('en'), Locale('ar'), Locale('fr')],
      title: 'Clean Architecture Example',
      // theme: lightTheme,
      // darkTheme: darkTheme,
      themeMode: _currentThemeMode,
      home: Builder(
        builder: (context) {
          return BlocProvider(
            create: (context) => widget.bloc,
            child: const CatsScreen(),
          );
        },
      ),
    );
  }
}
