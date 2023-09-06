import 'dart:async';

import '../base/baseviewmodel.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import 'onBoarding.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream constrollers

  final StreamController _streamController =
      StreamController<SlideViewObject>();

  late final List<SliderObject> _sliderList;
  int _currentPage = 0;

  //inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderList = _getSliderData();
    //send this slider data our view
    _postDataToView();
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

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  //outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map((slideViewObject) => slideViewObject);

  //private function
  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubtitle1,
          ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubtitle2,
          ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubtitle3,
          ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubtitle4,
          ImageAssets.onboardingLogo4,
        ),
      ];

  _postDataToView() {
    inputSliderViewObject.add(SlideViewObject(
        _sliderList[_currentPage], _sliderList.length, _currentPage));
  }
}

//inputs mean the orders that our view model will revieve from our view
abstract mixin class OnBoardingViewModelInputs {
  void goNext(); //when user clicks on on right arrow or swipe left
  void goPrevious(); //when user clicks on on left arrow or swipe right
  void onPageChanged(int index); //when user swipes on the screen

  Sink
      get inputSliderViewObject; //this is the way to add data to the stream .. stream input
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
