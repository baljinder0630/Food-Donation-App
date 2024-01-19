import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_donation_app/Pages/Donate/otp_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:food_donation_app/Pages/Donate/camera_preview.dart';

@RoutePage()
class DonateForm extends StatefulWidget {
  const DonateForm({super.key});

  @override
  State<DonateForm> createState() => _DonateFormState();
}

class _DonateFormState extends State<DonateForm> {
  static String verificationIdentity = "";
  bool value = false;
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController plotNoEditingController = TextEditingController();
  TextEditingController streetNameEditingController = TextEditingController();
  TextEditingController landmarkEditingController = TextEditingController();
  TextEditingController districtEditingController = TextEditingController();
  TextEditingController pinCodeEditingController = TextEditingController();

  List<Map<dynamic, dynamic>> data = [
    {
      'img': 'images/fruits.png',
      'category': 'Fruits and veggies',
    },
    {
      'img': 'images/bakery.png',
      'category': 'Bread & Bakery Items',
    },
    {
      'img': 'images/dairy.png',
      'category': 'Dairy Products',
    },
    {
      'img': 'images/beverage1.png',
      'category': 'Drinks & Beverages',
    },
    {
      'img': 'images/groceries.png',
      'category': 'Food items & supplies',
    },
    {
      'img': 'images/vegetables.png',
      'category': 'Packed items',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: (Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 150.0,
                      child: Image.asset('images/donate_food.png'),
                    )),
                  ),
                  const Text(
                    "Want to Donate Food?",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.category_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Choose your category",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    height: 200.0,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  data[index]['img'],
                                  width: 70.0,
                                  height: 80.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(children: [
                                Text(
                                  data[index]['category'],
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                height: 2.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.orange,
                                shape: const CircleBorder(),
                                mini: true,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(children: [
                            const Text(
                              "Type if you have something else",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0),
                              ),
                            )
                          ]),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CameraScreen()));
                          },
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          mini: true,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                value = !value;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 2.0,
                                ),
                                color:
                                    value ? Colors.orange : Colors.transparent,
                              ),
                              width: 24.0,
                              height: 24.0,
                              child: value
                                  ? const Icon(
                                      Icons.check,
                                      size: 16.0,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "No I Am Donating It As Funds",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                "Fill your personal details",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50)
                            ],
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red.shade900,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red.shade900,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Name cannot be empty';
                              } else if (text.length < 2 || text.length > 49) {
                                return 'Please enter a valid name';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (text) {
                              setState(() {
                                nameTextEditingController.text = text;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                          child: IntlPhoneField(
                            dropdownIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            showCountryFlag: true,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red.shade900,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red.shade900,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            cursorColor: Colors.blue.shade800,
                            initialCountryCode: 'IN',
                            onChanged: (text) => {
                              setState(() {
                                phoneTextEditingController.text =
                                    text.completeNumber;
                              })
                            },
                          ),
                        ),
                        const Text(
                          "An OTP will be sent to this phone number",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              print(phoneTextEditingController.text);
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: phoneTextEditingController.text,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed:
                                    (FirebaseAuthException e) {},
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  verificationIdentity = verificationId;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return OtpScreen(id: verificationId);
                                      },
                                    ),
                                  );
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
                            },
                            child: const Text("Send OTP")),
                        const SizedBox(height: 30.0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                "Fill your address",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(children: [
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Plot No',
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.orange,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade900,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade900,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.length > 49) {
                                  return 'Please enter valid details.';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {
                                  plotNoEditingController.text = text;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Street Name',
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.orange,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade900,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade900,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.length > 49) {
                                  return 'Please enter valid details.';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {
                                  streetNameEditingController.text = text;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50)
                              ],
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'LandMark',
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.orange,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade900,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red.shade900,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.length > 49) {
                                  return 'Please enter valid details.';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {
                                  landmarkEditingController.text = text;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(50)
                                    ],
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: 'District',
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.orange,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red.shade900,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red.shade900,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.length > 49) {
                                        return 'Please enter valid details.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      setState(() {
                                        districtEditingController.text = text;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(50)
                                    ],
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: 'PinCode',
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.orange,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red.shade900,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red.shade900,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null || text.length > 49) {
                                        return 'Please enter valid details.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      setState(() {
                                        pinCodeEditingController.text = text;
                                      });
                                    },
                                  ),
                                )
                              ],
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
