import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBooks);
  runApp(const BooklyCleanArch());
}

class BooklyCleanArch extends StatelessWidget {
  const BooklyCleanArch({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}
