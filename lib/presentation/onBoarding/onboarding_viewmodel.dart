import 'dart:async';

import '../../domain/model/model.dart';
import '../base/baseviewmodel.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import 'onBoarding.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream constrollers

  final StreamController _streamController =
      StreamController<SliderViewObject>();

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
  int goNext() {
    int nextIndex = ++_currentPage; // +1
    if (nextIndex == _sliderList.length) {
      _currentPage = 0; // infinite loop to go to first item inside the slider
    }
    return _currentPage;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentPage; // -1
    if (previousIndex == -1) {
      _currentPage = _sliderList.length - 1; // infinite loop
    }
    return _currentPage;
  }

  @override
  void onPageChanged(int index) {
    _currentPage = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  //outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
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
    inputSliderViewObject.add(SliderViewObject(
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
  Stream<SliderViewObject>
      get outputSliderViewObject; //this is the way to get data from the stream .. stream output
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
