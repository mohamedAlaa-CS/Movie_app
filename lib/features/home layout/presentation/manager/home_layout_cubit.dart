import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/home%20layout/presentation/manager/home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutIntialState());

  HomeLayoutCubit get(context) => BlocProvider.of<HomeLayoutCubit>(context);
  
}
