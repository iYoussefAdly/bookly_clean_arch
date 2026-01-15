import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/core/utils/functions/save_service_locator.dart';
import 'package:bookly_clean_arch/core/utils/simple_bloc_observer.dart';
import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  saveServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyCleanArch());
}

class BooklyCleanArch extends StatelessWidget {
  const BooklyCleanArch({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          ),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
