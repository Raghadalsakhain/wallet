import 'package:get_it/get_it.dart';
import 'package:wallet/features/home/data/datasource/datasource.dart';
import 'package:wallet/features/home/data/repo-implemention/repo-implemention.dart';
import 'package:wallet/features/home/presention/logic/bloc/mony_bloc.dart';

final getit=GetIt.instance; 
void  stup(){
getit.registerLazySingleton<homescreenApi>(()=>homescreenApi()); 
getit.registerLazySingleton<categoryRepository>(()=>categoryRepository(api: getit<homescreenApi>())); 
getit.registerFactory<MonyBloc>(()=>MonyBloc()); 

}