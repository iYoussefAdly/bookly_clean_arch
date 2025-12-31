import 'package:bookly_clean_arch/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:DetailsViewBody(),
    );
  }
}