abstract class BaseViewModel {
  //shared variables and function that will be used through any view model
}

abstract class BaseViewModelInputs {
  void start(); // will be called while initializing the view model
  void dispose(); // will be called while disposing the view model
}

abstract class BaseViewModelOutputs {
}
