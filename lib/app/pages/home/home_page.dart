// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fifa_book_app/app/pages/home/view/home_view_impl.dart';
import 'package:flutter/material.dart';
import 'package:fifa_book_app/app/core/ui/styles/button_styles.dart';
import 'package:fifa_book_app/app/core/ui/styles/colors_app.dart';
import 'package:fifa_book_app/app/core/ui/styles/text_styles.dart';
import 'package:fifa_book_app/app/core/ui/widgets/button.dart';
import 'package:fifa_book_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fifa_book_app/app/pages/home/widgets/status_tile.dart';
import 'package:fifa_book_app/app/pages/home/widgets/sticker_percent_widget.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              widget.presenter.logout();
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Image.asset(
                        'assets/images/bola.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    StickerPercentWidget(
                      percent: user?.totalCompletePercent ?? 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${user?.totalStickers} figurinhas',
                      style: context.textStyles.titleWhite,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StatusTile(
                      icon: Image.asset(
                        'assets/images/all_icon.png',
                      ),
                      label: 'Todas',
                      value: user?.totalAlbum ?? 0,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    StatusTile(
                      icon: Image.asset(
                        'assets/images/missing_icon.png',
                      ),
                      label: 'Faltando',
                      value: user?.totalComplete ?? 0,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    StatusTile(
                      icon: Image.asset(
                        'assets/images/repeated_icon.png',
                      ),
                      label: 'Repetidas',
                      value: user?.totalDuplicates ?? 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                      width: size.width * .9,
                      style: context.buttonStyles.yellowOutlineButton,
                      labelStyle: context.textStyles.textSecondaryFontExtraBold
                          .copyWith(color: context.colors.yellow),
                      label: 'Minhas Figurinhas',
                      outline: true,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/my-stickers');
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
