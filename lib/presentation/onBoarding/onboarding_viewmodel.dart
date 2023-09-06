import 'dart:async';

import '../base/baseviewmodel.dart';
import 'onBoarding.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream constrollers

  final StreamController _streamController =
      StreamController<SlideViewObject>();

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

  Sink get inputSliderViewObject; //this is the way to add data to the stream .. stream input
}

//outputs mean data or results that will be sent from our view model to our view
abstract mixin class OnBoardingViewModelOutputs {
  Stream<SlideViewObject>
      get outputSliderViewObject; //this is the way to get data from the stream .. stream output
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
