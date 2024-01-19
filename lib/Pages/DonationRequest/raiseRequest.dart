import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/Community/Widgets/myBackButton.dart';

@RoutePage()
class RaiseRequest extends StatefulWidget {
  const RaiseRequest({Key? key}) : super(key: key);

  @override
  State<RaiseRequest> createState() => _RaiseDonationReq();
}

class _RaiseDonationReq extends State<RaiseRequest> {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumberController = TextEditingController();

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Raise Donation Request"),
        leading: MyBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextFormField(
                  label: "Name of Trust or NGO's",
                ),
                SizedBox(height: 16),
                _buildDropdownFormField(
                  label: 'Type of Request',
                  items: ['Request 1', 'Request 2', 'Request 3', 'Request 4'],
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                    label: '+91 Mobile Number',
                    controller: _mobileNumberController,
                    suffixWidget: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Send OTP'),
                      ),
                    )),
                SizedBox(height: 16),
                Text(
                  'An OTP Will Be Send to this mobile number',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  label: 'Plot No.',
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  label: 'Street Name',
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  label: 'Landmark',
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextFormField(
                        label: 'District',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTextFormField(
                        label: 'PinCode',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    TextEditingController? controller,
    Widget? suffixWidget,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          suffixIcon: suffixWidget,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        style: TextStyle(
          fontSize: 16.0, // Adjust the multiplier as needed
        ),
      ),
    );
  }

  Widget _buildDropdownFormField({
    required String label,
    required List<String> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}
