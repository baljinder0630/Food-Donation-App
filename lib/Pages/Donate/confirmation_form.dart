import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/button.dart';
import 'package:food_donation_app/Pages/Donate/Widgets/custom_subheading.dart';
import 'package:food_donation_app/Provider/donateRequestProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@RoutePage()
class ConfirmationForm extends ConsumerStatefulWidget {
  const ConfirmationForm({super.key});

  @override
  ConsumerState<ConfirmationForm> createState() => _ConfirmationFormState();
}

class _ConfirmationFormState extends ConsumerState<ConfirmationForm> {
  @override
  Widget build(BuildContext context) {
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
                  CustomButton(
                          text: ref.watch(donationRequestProvider.notifier).getStatus()==FoodCategoryStatus.processing?'Processing':'Donate',
                          onPressed: () async {
                            final response = await ref
                                .read(donationRequestProvider.notifier)
                                .raiseRequest();
                            if(response){
                              Fluttertoast.showToast(
                                  msg: "Donated successfully.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              context.pushRoute(HomePageRoute());
                            }
                            else{
                              Fluttertoast.showToast(
                                  msg: "Error while submitting the data.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              return;
                            }
                          },
                        ),

                ],
              )
            ]),
      ),
    );
  }
}
