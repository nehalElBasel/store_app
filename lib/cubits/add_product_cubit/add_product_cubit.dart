import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_store_app/cubits/add_product_cubit/add_product_cubit_status.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(IntialAddProduct());
}
