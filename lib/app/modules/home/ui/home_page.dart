import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/app/core/widgets/show_snack_bar_widget.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/models/info_character_dom.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/bloc/home_bloc.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/bloc/home_state.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/widgets/card_hero_widget.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/widgets/show_error_msg_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  late HomeBloc homeBloc;

  @override
  void initState() {
    scrollController = ScrollController();
    homeBloc = context.read<HomeBloc>();
    scrollController
        .addListener(() => homeBloc.scrollControllerListener(scrollController));
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(
        () => homeBloc.scrollControllerListener(scrollController));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Personajes de Rick And Morty'), elevation: 0),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (BuildContext ctx, HomeState state) async {
          if (state is HomeErrorState) {
            await SnackBarFloating.show(
                ctx, state.controlError?.message ?? 'Unknown',
                type: TypeAlert.error);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            if (state is HomeInitState) {
              return const SizedBox();
            } else if (state is HomeLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeErrorState) {
              return ShowErrorMsgWidget(onRefresh: () async {
                await homeBloc.init();
              });
            } else if (state is HomeSuccessState) {
              return _renderViewCharacters(context, homeBloc);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _renderViewCharacters(BuildContext context, HomeBloc homeBloc) {
    return StreamBuilder<List<InfoCharacterDom>?>(
      stream: homeBloc.listDom.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, idx) {
                  return CardHeroWidget(character: snapshot.data![idx]);
                },
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: homeBloc.loadingScroll,
              builder: (context, value, child) => Visibility(
                visible: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
