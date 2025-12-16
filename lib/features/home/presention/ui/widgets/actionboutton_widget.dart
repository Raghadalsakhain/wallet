import 'package:flutter/material.dart';
import 'package:wallet/core/extension/appSize.dart';
import 'package:wallet/core/style/color/appcolors.dart';
import 'package:wallet/core/widgets/boutton.dart';

class ActionbouttonWidget extends StatelessWidget {
  const ActionbouttonWidget({super.key, required this.addmoneyaction, required this.transofermmoneyaction});
final VoidCallback addmoneyaction; 
final VoidCallback transofermmoneyaction; 

  @override
  Widget build(BuildContext context) {
    return  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Boutton(
                        text: 'Add mony',
                        backGroudcolor: const Color.fromARGB(
                          255,
                          180,
                          202,
                          159,
                        ),
                        width: context.getWidth() / 1.98,
                        icon: Icons.add,
                        ouline: false,
                        onPressed:addmoneyaction ,
                      ),
                      SizedBox(width: 20),
                      Boutton(
                        text: 'Transform',
                        backGroudcolor: Appcolors.baseligitcollor,
                        width: context.getWidth() / 2.6,
                        icon: Icons.arrow_outward_rounded,
                        ouline: false,
                        onPressed: transofermmoneyaction,
                      ),
                    ],
                  );
  }
}