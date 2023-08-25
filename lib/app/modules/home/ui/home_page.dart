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

  Widget textValue(String value, {bool title = false}) => Text(value,
      style:
          title ? TextStyle(fontSize: 18, fontWeight: FontWeight.bold) : null);

  Widget _renderViewCharacters(BuildContext context, HomeBloc homeBloc) {
    return StreamBuilder<List<InfoCharacterDom>?>(
      stream: homeBloc.listDom.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  textValue('La serie en números', title: true),
                  textValue('${homeBloc.numberEpisodes} número de episodios'),
                  textValue('Lugar o ubicación con mas personajes:', title: true),
                  textValue(homeBloc.nameLocation),
                ],
              ),
            ),
            Expanded(
              flex: 12,
              child: ListView.builder(
                controller: scrollController,
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, idx) =>
                    CardHeroWidget(character: snapshot.data![idx]),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: homeBloc.loadingScroll,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(child: CircularProgressIndicator()),
              ),
              builder: (context, value, child) =>
                  Visibility(visible: value, child: child!),
            )
          ],
        );
      },
    );
  }
}
