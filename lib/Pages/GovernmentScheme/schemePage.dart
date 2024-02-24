import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Community/Widgets/myAppBar.dart';
import '../constants/constants.dart';

@RoutePage()
class SchemePage extends StatelessWidget {
  final List<Map<String, String>> schemes = [
    {
      'schemeName': 'Pradhan Mantri Jan Dhan Yojana (PMJDY)',
      'govtOffering':
          'Deartment of Financial Services, Ministry of Finance, Government of India.',
      'imageURL': 'assets/SchemeImages/scheme_pradhan.jpeg',
      'description':
          "Pradhan Mantri Jan-Dhan Yojana (PMJDY) is National Mission for Financial Inclusion to ensure access to financial services, namely, a basic savings & deposit accounts, remittance, credit, insurance, pension in an affordable manner. Under the scheme, a basic savings bank deposit (BSBD) account can be opened in any bank branch or Business Correspondent (Bank Mitra) outlet, by persons not having any other account.\nBenefits under PMJDY\n1. One basic savings bank account is opened for unbanked person.\n2.There is no requirement to maintain any minimum balance in PMJDY accounts.\n3.Interest is earned on the deposit in PMJDY accounts.\n4.Rupay Debit card is provided to PMJDY account holder.\n5.Accident Insurance Cover of Rs.1 lakh (enhanced to Rs. 2 lakh to new PMJDY accounts opened after 28.8.2018) is available with RuPay card issued to the PMJDY account holders.\n6.An overdraft (OD) facility up to Rs. 10,000 to eligible account holders is available.\n7.PMJDY accounts are eligible for Direct Benefit Transfer (DBT), Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY), Pradhan Mantri Suraksha Bima Yojana (PMSBY), Atal Pension Yojana (APY), Micro Units Development & Refinance Agency Bank (MUDRA) scheme.",
      'externalLink': 'https://www.pmjdy.gov.in/scheme',
    },
    {
      'schemeName': 'Pradhan Mantri Jan Dhan Yojana (PMJDY)',
      'govtOffering':
          'Deartment of Financial Services, Ministry of Finance, Government of India.',
      'imageURL': 'assets/SchemeImages/scheme_pradhan.jpeg',
      'description':
          "Pradhan Mantri Jan-Dhan Yojana (PMJDY) is National Mission for Financial Inclusion to ensure access to financial services, namely, a basic savings & deposit accounts, remittance, credit, insurance, pension in an affordable manner. Under the scheme, a basic savings bank deposit (BSBD) account can be opened in any bank branch or Business Correspondent (Bank Mitra) outlet, by persons not having any other account.\nBenefits under PMJDY\n1. One basic savings bank account is opened for unbanked person.\n2.There is no requirement to maintain any minimum balance in PMJDY accounts.\n3.Interest is earned on the deposit in PMJDY accounts.\n4.Rupay Debit card is provided to PMJDY account holder.\n5.Accident Insurance Cover of Rs.1 lakh (enhanced to Rs. 2 lakh to new PMJDY accounts opened after 28.8.2018) is available with RuPay card issued to the PMJDY account holders.\n6.An overdraft (OD) facility up to Rs. 10,000 to eligible account holders is available.\n7.PMJDY accounts are eligible for Direct Benefit Transfer (DBT), Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY), Pradhan Mantri Suraksha Bima Yojana (PMSBY), Atal Pension Yojana (APY), Micro Units Development & Refinance Agency Bank (MUDRA) scheme.",
      'externalLink': 'Link 1',
    },
    {
      'schemeName': 'Scheme 1',
      'govtOffering': 'Offering 1',
      'imageURL': 'assets/SchemeImages/scheme_pradhan.jpeg',
      'description': 'Description 1',
      'externalLink': 'Link 1',
    },
    // Add more schemes as needed
  ];

  SchemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50.h,
          ),
          MyAppBar(
            centerWidget: Padding(
              padding: EdgeInsets.only(left: 57.w),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200.w,
                  height: 40.h,
                  padding: EdgeInsets.only(top: 5.h),
                  child: Text(
                    "Govt. Schemes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            rightWidget: Padding(
              padding: EdgeInsets.only(right: 34.18.w),
              child: IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: schemes.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 260,
                  margin: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            schemes[index]['imageURL']!,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              schemes[index]['schemeName']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              schemes[index]['govtOffering']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
