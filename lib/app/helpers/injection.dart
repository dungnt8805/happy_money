import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:happy_money/app/helpers/injection.config.dart';


final GetIt getIt = GetIt.instance;
@InjectableInit(preferRelativeImports:false)
GetIt configureDependencies() => getIt.init();