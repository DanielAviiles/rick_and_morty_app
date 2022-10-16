import 'package:flutter/material.dart';

class ShowErrorMsgWidget extends StatelessWidget {
  const ShowErrorMsgWidget({Key? key, this.onRefresh}) : super(key: key);

  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        if (onRefresh != null) await onRefresh!();
      },
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .35),
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orangeAccent.shade200,
            size: 40,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Text(
                'Error al cargar datos de personajes. Desliza de arriba hacía abajo para intentar refrescar nuevamente.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
