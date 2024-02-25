import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_donation_app/Pages/Community/Functions/toCamelCase.dart';
import 'package:share/share.dart';
import 'package:url_launcher/link.dart';

import '../Community/Widgets/myAppBar.dart';
import '../constants/constants.dart';

@RoutePage()
class SchemePage extends StatelessWidget {
  final List<Map<String, String>> schemes = [
    {
      'schemeName': 'Saksham Anganwadi and Poshan 2.0',
      'govtOffering':
          'Ministry of Women and Child Development, Government of India.',
      'imageURL': 'assets/SchemeImages/scheme_5_poshan.jpg',
      'description':
          "Mission Saksham Anganwadi and Poshan 2.0 aims to address the problems of malnutrition in children, adolescent girls, pregnant women, and lactating mothers through a strategic shift in nutrition content and delivery and the development of a converging ecosystem.\n\nPoshan 2.0 will include three significant initiatives within its purview: Anganwadi Services, the Scheme for Adolescent Girls, and Poshan Abhiyaan.\n\nMoreover, Poshan 2.0 will concentrate on Maternal Nutrition, Infant and Young Child Feeding Norms, Treatment of MAM/SAM, and Wellness through AYUSH. Convergence, governance, and capacity-building will serve as its three pillars.\n\nTo achieve its goals, Mission Poshan 2.0 will combine a number of crucial initiatives, including corrective measures, campaigns to raise nutrition awareness, communication methods, and the development of sustainable ecosystems.Anganwadi Service Scheme Under Poshan 2.0\n\nThe Anganwadi Services Scheme provides the following services to eligible beneficiaries:\n\n1.supplementary nutrition\n2.pre-school non-formal education\n3.nutrition & health education\n4.immunization\n5.health check-up\n6.referral services",
      'externalLink':
          'https://wcd.nic.in/acts/guidelines-mission-saksham-anganwadi-and-poshan-20',
    },
    {
      'schemeName': 'Breakfast scheme: Feeding the future',
      'govtOffering':
          'Ministry of Health & Family Welfare, Government of India.',
      'imageURL': 'assets/SchemeImages/scheme_6.jpg',
      'description':
          "From Monday through Friday, the breakfast scheme would be offered at a cost of Rs 33.56 crore to more than 1,500 government-run schools around the state.\n\nIn government schools, 1.14 lakh pupils in grades 1 through 5 are expected to benefit at an estimated cost of Rs 12.75 per pupil.\n\nThe government has set a goal of giving pupils 293 calories and 9.85 grammes of protein on average per day. Upma, kichadi, pongal, and on Fridays, rava kesari or semiya kesari, will all be offered in various variations to the students.\n\nThis programme advances the nationwide midday meal programme that the state pioneered in 1983.",
      'externalLink':
          'https://www.theweek.in/news/india/2022/09/15/tamil-nadu-launches-breakfast-scheme-for-school-students-how-does-it-add-nutrition-to-the-plate.html',
    },
    {
      'schemeName': 'Eat Right India',
      'govtOffering':
          'Ministry of Health & Family Welfare, Government of India.',
      'imageURL': 'assets/SchemeImages/scheme_4_eat_right.png',
      'description':
          "In the preamble to the Food Safety and Standards Act, 2006, the Food Safety and Standards Authority of India (FSSAI) is expected to ensure availability of safe and wholesome food for the people in India. Therefore, FSSAI has embarked on a large-scale effort to transform the country's food system in order to ensure safe, healthy and sustainable food for all Indians through the 'Eat Right India' movement.The tagline 'Sahi Bhojan. Behtar Jeevan', thus, forms the foundation of this movement.\n\nEat Right India adopts a judicious mix of regulatory, capacity building, collaborative and empowerment approaches to ensure that our food is good both for the people and the planet. Further, it builds on the collective action of all stakeholders - the government, food businesses, civil society organizations, experts and professionals, development agencies and citizens at large.\n\nEat Right India adopts an integrative or 'whole of the government' approach since the movement brings together food-related mandates of the agriculture, health, environment and other ministries.\nFurthermore, since foodborne illnesses and various diet-related diseases cut across all age groups and all sections of the society it also adopts a 'whole of society' approach, bringing all stakeholders together on a common platform.\n\nEat Right India is aligned to thethe National Health Policy 2017 with its focus on preventive and promotive healthcare and flagship programmes like Ayushman Bharat, POSHAN Abhiyaan, Anemia Mukt Bharat and Swacch Bharat Mission.",
      'externalLink': 'https://eatrightindia.gov.in/eatrightindia.jsp',
    },
    {
      'schemeName':
          'Pradhan Mantri Formalisation Of Micro Food Processing Enterprises',
      'govtOffering':
          'Ministry of Food Processing Industries, Government of India.',
      'imageURL': 'assets/SchemeImages/scheme_3_food.png',
      'description': ""
          "Launched on 29th June 2020, PMFMPE is a Centrally Sponsored Scheme by the Ministry of Food Processing Industries, designed to address the challenges faced by the micro-enterprises and to tap the potential of groups and cooperatives in supporting the upgradation and formalization of these enterprises.\n\nAims:\n\n1.Enhance the competitiveness of existing individual micro-enterprises in the unorganized segment of the food processing industry and promote formalization of the sector; and\n\n2.Support Farmer Producer Organizations (FPOs), Self Help Groups (SHGs), and Producers Cooperatives along their entire value chain.\n\nObjectives:\n\nTo build the capability of microenterprises to enable:\n\n1.Increased access to credit by existing micro food processing entrepreneurs, FPOs, Self Help Groups, and Co-operatives.\n\n2.Integration with an organized supply chain by strengthening branding & marketing.\n\n3.Support for the transition of existing 2,00,000 enterprises into a formal framework.\n\n4.Increased access to common services like common processing facilities, laboratories, storage, packaging, marketing, and incubation services.\n\n5.Strengthening of institutions, research, and training in the food processing sector; and\n\n6.Increased access for the enterprises, to professional and technical support.",
      'externalLink': 'https://pmfme.mofpi.gov.in/pmfme/#/Home-Page',
    },
    {
      'schemeName': 'Pradhan Mantri Jan Dhan Yojana (PMJDY)',
      'govtOffering':
          'Deartment of Financial Services, Ministry of Finance, Government of India.',
      'imageURL': 'assets/SchemeImages/scheme_pradhan.jpeg',
      'description':
          "Pradhan Mantri Jan-Dhan Yojana (PMJDY) is National Mission for Financial Inclusion to ensure access to financial services, namely, a basic savings & deposit accounts, remittance, credit, insurance, pension in an affordable manner. Under the scheme, a basic savings bank deposit (BSBD) account can be opened in any bank branch or Business Correspondent (Bank Mitra) outlet, by persons not having any other account.\n\nBenefits under PMJDY\n\n1.One basic savings bank account is opened for unbanked person.\n\n2.There is no requirement to maintain any minimum balance in PMJDY accounts.\n\n3.Interest is earned on the deposit in PMJDY accounts.\n\n4.Rupay Debit card is provided to PMJDY account holder.\n\n5.Accident Insurance Cover of Rs.1 lakh (enhanced to Rs. 2 lakh to new PMJDY accounts opened after 28.8.2018) is available with RuPay card issued to the PMJDY account holders.\n\n6.An overdraft (OD) facility up to Rs. 10,000 to eligible account holders is available.\n\n7.PMJDY accounts are eligible for Direct Benefit Transfer (DBT), Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY), Pradhan Mantri Suraksha Bima Yojana (PMSBY), Atal Pension Yojana (APY), Micro Units Development & Refinance Agency Bank (MUDRA) scheme.",
      'externalLink': 'https://www.pmjdy.gov.in/scheme',
    },
    {
      'schemeName': 'Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY)',
      'govtOffering':
          'Deartment of Financial Services, Ministry of Finance, Government of India.',
      'imageURL': 'assets/SchemeImages/scheme_2_pm.jpg',
      'description':
          "This scheme is a one year renewable life insurance plan. A life cover of Rs 2 lakh is provided at an annual premium of Rs 330 payable at the time of renewal of the plan. The premium will be deducted from the account holder’s savings bank account through ‘auto debit’ facility.\n\nKey Points:\n\n1.If one wishes to exit the scheme at any point, she/he may join again in future by submitting a declaration of good health in the prescribed proforma.\n\n2.There is no maturity or surrender benefit under this plan.\n\n3.Account holder’s insurance will be terminated once she/he attains the age of 55\n\n4.Account can also be closed due to insufficiency of balance for debiting premium or if the bank shuts down.\n\n5.Eligibility Criteria: People aged between 18-50 who hold a savings account can apply for the scheme.\n\n6.Income Tax benefits and exemptions will be available as per the income tax laws which are subject to change from time to time.\n\nWhere to apply: The form can be downloaded online and can be submitted to your bank. A few banks also offer SMS and net banking based enrollment. Click here to know more.",
      'externalLink': 'https://financialservices.gov.in/beta/en/pmjjby',
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
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: schemes.length,
              // scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(15.r),
                  padding: EdgeInsets.all(15.r),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          child: Image.asset(
                            schemes[index]['imageURL']!,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              Text(
                                toCamelCase(
                                  schemes[index]['schemeName']!,
                                ),
                                style: TextStyle(
                                  fontSize: 19.sp,
                                  color: black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                toCamelCase(
                                  schemes[index]['govtOffering']!,
                                ),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: black.withOpacity(0.8),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.only(right: 10.r),
                                child: Text(
                                  schemes[index]['description']!,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: black.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Link(
                              uri: Uri.parse(schemes[index]['externalLink']!),
                              target: LinkTarget.defaultTarget,
                              builder: (context, openLink) => TextButton(
                                onPressed: openLink,
                                child: SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    "Apply Now",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: green,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await Share.share(
                                    "Learn about ${schemes[index]['schemeName']} by ${schemes[index]['govtOffering']}\nClick the following link for more details.\n\n${schemes[index]['externalLink']}",
                                    subject: 'Sharing the data');
                              },
                              child: Icon(
                                Icons.share_sharp,
                                size: 30.r,
                                color: green,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
