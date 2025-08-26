class AddProductStates {}

class IntialProduct extends AddProductStates {}

class LoadingProduct extends AddProductStates {}

class SuccessProduct extends AddProductStates {}

class FailureProduct extends AddProductStates {
  FailureProduct(this.errorMessage);
  final String errorMessage;
}
