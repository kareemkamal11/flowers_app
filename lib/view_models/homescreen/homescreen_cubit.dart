import 'package:flowers/model/category/discovery_category/descovery_category_data.dart';
import 'package:flowers/model/category/discovery_category/discovery_category_model.dart';
import 'package:flowers/view_models/homescreen/homescreen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  List<DiscoveryCategoryModel> cListDiscoveryCategory = listDiscoveryCategory;

  
}
