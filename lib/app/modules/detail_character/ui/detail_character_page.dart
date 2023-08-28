/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/app/core/widgets/show_snack_bar_widget.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/ui/bloc/detail_character_bloc.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/ui/bloc/detail_character_state.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/ui/widgets/detail_card_character_widget.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/widgets/show_error_msg_widget.dart';

class DetailCharacterPage extends StatefulWidget {
  const DetailCharacterPage({Key? key}) : super(key: key);

  @override
  State<DetailCharacterPage> createState() => _DetailCharacterPageState();
}

class _DetailCharacterPageState extends State<DetailCharacterPage> {
  late DetailCharacterBloc detailCharacterBloc;
  int characterId = 0;

  @override
  void initState() {
    detailCharacterBloc = context.read<DetailCharacterBloc>();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    characterId = ModalRoute.of(context)!.settings.arguments as int;
    await detailCharacterBloc.didChangeDependencies(characterId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle del personaje')),
      body: BlocListener<DetailCharacterBloc, DetailCharacterState>(
        listener: (BuildContext ctx, DetailCharacterState state) async {
          if (state is DetailCharacterErrorState) {
            await SnackBarFloating.show(
                ctx, state.controlError?.message ?? 'Unknown',
                type: TypeAlert.error);
          }
        },
        child: BlocBuilder<DetailCharacterBloc, DetailCharacterState>(
          builder: (BuildContext context, DetailCharacterState state) {
            if (state is DetailCharacterInitState) {
              return const SizedBox();
            } else if (state is DetailCharacterLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DetailCharacterErrorState) {
              return ShowErrorMsgWidget(onRefresh: () async {
                detailCharacterBloc.emitState(DetailCharacterState.loading());
                final data = await detailCharacterBloc
                    .executeGetCharacterById(characterId);
                detailCharacterBloc
                    .emitState(DetailCharacterState.success(character: data));
              });
            } else if (state is DetailCharacterSuccessState) {
              return DetailCardCharacter(character: state.character!);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
 */