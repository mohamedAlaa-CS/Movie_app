import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/api_service.dart';
import 'package:movie/features/brawser/data/repos/brawser_repo_impel.dart';
import 'package:movie/features/brawser/presentation/manager/brawser%20cubit/brawser_cubit.dart';
import 'package:movie/features/brawser/presentation/view/widgets/brawser_grid_view.dart';

class BrawserView extends StatelessWidget {
  static const String routeName = '/brawser_view';
  const BrawserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BrawserCubit(BrawserRepoImpel(apiService: ApiService(Dio())))
            ..fetchCategoryNames(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Browse Category ',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 13.h),
              const Expanded(child: BrawserGrideView()),
            ],
          ),
        ),
      ),
    );
  }
}
