import '../base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

//inputs mean the orders that our view model will revieve from our view
abstract mixin class OnBoardingViewModelInputs {
  void goNext(); //when user clicks on on right arrow or swipe left
  void goPrevious(); //when user clicks on on left arrow or swipe right
  void onPageChanged(int index); //when user swipes on the screen
}

//outputs mean data or results that will be sent from our view model to our view
abstract mixin class OnBoardingViewModelOutputs {}
