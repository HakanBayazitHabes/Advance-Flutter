import 'package:advance_flutter/domain/model/model.dart';
import 'package:advance_flutter/presentation/common/state_renderer/state_render_impl.dart';
import 'package:advance_flutter/presentation/main/home/home_viewmodel.dart';
import 'package:advance_flutter/presentation/resources/strings_manager.dart';
import 'package:advance_flutter/presentation/resources/values_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../app/di.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel _viewModel = instance<HomeViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidgets(),
                  () {
                _viewModel.start();
              }) ??
              Container();
        },
      )),
    );
  }

  Widget _getContentWidgets() {
    return StreamBuilder<HomeViewObject>(
      stream: _viewModel.outputHomeData,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getBanner(snapshot.data?.banners),
            _getSection(AppStrings.services),
            _getServicesWidget(snapshot.data?.services),
            _getSection(AppStrings.stores),
            _getStoresWidget(snapshot.data?.stores),
          ],
        );
      },
    );
  }

  Widget _getSection(String title) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget _getBanner(List<BannerAd>? banners) {
    if (banners != null) {
      return CarouselSlider(
        items: banners
            .map((banner) => SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: AppSize.s1_5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                      side: BorderSide(
                          color: ColorManager.white, width: AppSize.s1_5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: Image.network(
                        banner.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: AppSize.s190,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getServicesWidget(List<Service>? services) {
    if (services != null) {
      return Padding(
        padding: EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: Container(
          height: AppSize.s140,
          margin: EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: services
                .map(
                  (services) => Card(
                    elevation: AppSize.s4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                      side: BorderSide(
                          color: ColorManager.white, width: AppSize.s1_5),
                    ),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        child: Image.network(
                          services.image,
                          fit: BoxFit.cover,
                          height: AppSize.s100,
                          width: AppSize.s120,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppPadding.p8),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            services.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ]),
                  ),
                )
                .toList(),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getStoresWidget(List<Store>? stores) {
    if (stores != null) {
      return Padding(
        padding: EdgeInsets.only(
            left: AppPadding.p12, right: AppPadding.p12, top: AppPadding.p12),
        child: Flex(direction: Axis.vertical, children: [
          GridView.count(
            crossAxisSpacing: AppSize.s8,
            mainAxisSpacing: AppSize.s8,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(stores.length, (index) {
              return InkWell(
                onTap: () {
                  //navigate to store details screen
                  Navigator.of(context).pushNamed(Routes.storeDetailRoute);
                },
                child: Card(
                  elevation: AppSize.s4,
                  child: Image.network(
                    stores[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          )
        ]),
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
