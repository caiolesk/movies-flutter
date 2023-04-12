import 'package:flutter/material.dart';

class ErrorDialogOrganism extends StatelessWidget {
  final VoidCallback onErrorButtonTap;
  const ErrorDialogOrganism({
    Key? key,
    required this.onErrorButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          children: [
            const Text('Erro ao consultar o filme'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                onErrorButtonTap();
              },
              child: const Text('Tentar novamente'),
            ),
          ],
        ),
      ],
    );
  }
}
