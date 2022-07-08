import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/configs/theme/app_theme.dart';
import 'package:test/core/extenstions/custom_views.dart';
import 'package:test/core/extenstions/gradient_elevated_button.dart';
import 'package:test/core/resources/colors.dart';
import 'package:test/data/model/ski_model/ski_model.dart';

import '../../../core/extenstions/extenstions.dart';
import '../../../core/resources/dimensions.dart';

class SkiDetailPage extends StatelessWidget {
  const SkiDetailPage({Key? key}) : super(key: key);
  static const routeName = '/SkiDetailPage';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as SkiModel;
    final size = MediaQuery.of(context).size;

    Widget buildCustomAppBar() => Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 276,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data.imageUrl ?? ''),
                          fit: BoxFit.cover)),
                ),
                Container(
                    height: 276,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black12,
                          Colors.black
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        data.nameRu ?? '',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    )),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'asset/logo.png',
                    width: 82,
                    height: 44,
                  ),

                  /// растровый файл
                ),
              ],
            ),
            Positioned(
                left: 0,
                top: 50,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('asset/icons/back.svg',
                      color: backgroundColor),
                )),
          ],
        );

    Widget buildRoundedContainer() => Positioned(
          width: size.width,
          top: 223,
          child: Container(
            decoration: const BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16))),
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            margin: const EdgeInsets.only(right: 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Дата посещения',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: blackTitle),
                ),
                Text(
                  data.createdDate ?? '',
                  style: lightTextStyle,
                ),
              ],
            ),
          ),
        );

    Widget buildBottomWidgets() => Container(
      color: Colors.transparent,
      child: Padding(
            padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight / 2, left: 16, right: 16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              customListTile('Правила поведения в сноупарке', () {
                // TODO
              }),
              customListTile('Позвонить',() {
                // TODO
              }, lastGradient),
            ]),
          ),
    );

    Widget buildBody() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 27,
              ),
              Divider(
                color: lightColor.withOpacity(0.5),
                thickness: 1,
              ),
              const SizedBox(
                height: spacer,
              ),
              GestureDetector(
                onTap: () {
                  //TODO
                },
                child: Container(
                  width: double.infinity,
                  height: 64,
                  padding: const EdgeInsets.only(left: 12, right: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: lightColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(children: [
                    SvgPicture.asset(
                      'asset/icons/calendar.svg',
                      color: firstGradient,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Выберите дату',
                      style: darkTextStyle,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'asset/icons/next.svg',
                      color: firstGradient,
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: spacer,
              ),
              GestureDetector(
                onTap: () {
                  // TODO я бы обернул в ListView как это сделал в главном окне (создал бы отдельное окно, разделил...), но времени нет извините, в главном окне доказал что так умею делать :-)
                },
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.only(left: 12, right: 18),
                  decoration: BoxDecoration(
                    color: lightBack,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.tariffs?[0].nameRu ?? '',
                            style: darkTextStyle,
                          ),
                          Text(
                            format(data.tariffs?[0].priceInfo?.price),
                            style:
                                lightTextStyle.copyWith(color: subtitleColor),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'asset/icons/plus.svg',
                        color: lastGradient,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: spacer,
              ),
              GradientElevatedButton(
                  onPressed: () {}, title: 'Перейти к оплате'),
            ],
          ),
        );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [buildCustomAppBar(), buildRoundedContainer()]),
          buildBody(),
        ]),
      ),
      bottomSheet: buildBottomWidgets(),
    );
  }
}
