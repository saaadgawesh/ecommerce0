import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/feature/auth_model/auth_cubit.dart';
import 'package:flutter_application_1/presentation/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAUS_3mItj0hgoaNILVCNHzbwuvp1kB49o",
    appId: "com.example.flutter_application_1",
    messagingSenderId: "508330695270",
    projectId: "ecommerce-60608",
  ));
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: GoogleFonts.cairo().fontFamily,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
            ),
            inputDecorationTheme: InputDecorationTheme(
                focusedErrorBorder: const OutlineInputBorder(),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none),
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 10),
                filled: true,
                fillColor: const Color.fromARGB(255, 190, 209, 225)),
            dividerTheme: const DividerThemeData(
                color: Color.fromARGB(255, 192, 219, 240),
                indent: 20,
                endIndent: 20)),
        debugShowCheckedModeBanner: false,
        home: const splash(),
        builder: (context, child) {
          return Directionality(
              textDirection: TextDirection.rtl, child: child!);
        },
      ),
    );
  }
}
