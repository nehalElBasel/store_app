class AddProductStates {}

class IntialAddProduct extends AddProductStates {}

class LoadingAddProduct extends AddProductStates {}

class SuccessAddProduct extends AddProductStates {}

class FailureAddProduct extends AddProductStates {
  FailureAddProduct(this.errorMessage);
  final String errorMessage;
}
