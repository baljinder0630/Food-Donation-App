import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/button.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Provider/donateRequestProvider.dart';

@RoutePage()
class ConfirmationForm extends ConsumerStatefulWidget {
  const ConfirmationForm({super.key});

  @override
  ConsumerState<ConfirmationForm> createState() => _ConfirmationFormState();
}

class _ConfirmationFormState extends ConsumerState<ConfirmationForm> {
  @override
  Widget build(BuildContext context) {
    final status = ref.watch(donationRequestProvider.notifier).getStatus();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Subheading(text: 'Do you want to confirm the donation?'),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  status == FoodCategoryStatus.processing
                      ? const Text('Processing')
                      : CustomButton(
                          text: 'Donate',
                          onPressed: () {
                            ref
                                .read(donationRequestProvider.notifier)
                                .raiseRequest();
                          },
                        ),
                ],
              )
            ]),
      ),
    );
  }
}
