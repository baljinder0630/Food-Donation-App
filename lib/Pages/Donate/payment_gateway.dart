import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upi_india/upi_india.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController noteTextEditingController = TextEditingController();
  Future<UpiResponse>? _transaction;
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "kevlanisumit2004@okaxis",
      receiverName: 'Sumit Kevlani',
      transactionRefId: 'UPI_${DateTime.now().millisecondsSinceEpoch}',
      transactionNote: noteTextEditingController.text,
      amount: double.parse(priceTextEditingController.text),
    );
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty) {
      return const Center(
        child: Text(
          "No apps found to handle transaction.",
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter amount',
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Amount cannot be null.';
                    } else {
                      int amount = int.parse(text);
                      if (amount <= 0) {
                        return 'Amount can\'t be less than or equal to zero.';
                      } else if (amount > 25000) {
                        return 'Amount must not exceed 25000.';
                      } else {
                        return null;
                      }
                    }
                  },
                  onChanged: (text) {
                    setState(() {
                      priceTextEditingController.text = text;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(50)],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Note',
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return null;
                    } else if (text.length > 100) {
                      return 'Note must be smaller than 100 characters.';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (text) {
                    setState(() {
                      noteTextEditingController.text = text;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 0.0),
            child: const Text("Pay via:"),
          ),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                  onTap: () {
                    _transaction = initiateTransaction(app);
                    setState(() {});
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 3 - 16.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.memory(app.icon, height: 40, width: 40),
                        Text(app.name)
                      ],
                    ),
                  ));
            }).toList(),
          ),
        ],
      );
    }
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: "),
          Flexible(
              child: Text(
            body,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: MediaQuery.of(context).size.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                displayUpiApps(),
                FutureBuilder(
                    future: _transaction,
                    builder: (BuildContext context,
                        AsyncSnapshot<UpiResponse> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              _upiErrorHandler(snapshot.error.runtimeType),
                            ),
                          );
                        }
                        UpiResponse _upiResponse = snapshot.data!;

                        String txnId = _upiResponse.transactionId ?? 'N/A';
                        String resCode = _upiResponse.responseCode ?? 'N/A';
                        String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                        String status = _upiResponse.status ?? 'N/A';
                        String approvalRef =
                            _upiResponse.approvalRefNo ?? 'N/A';
                        _checkTxnStatus(status);

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              displayTransactionData('Transaction Id', txnId),
                              displayTransactionData('Response Code', resCode),
                              displayTransactionData('Reference Id', txnRef),
                              displayTransactionData(
                                  'Status', status.toUpperCase()),
                              displayTransactionData(
                                  'Approval No', approvalRef),
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(''),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
