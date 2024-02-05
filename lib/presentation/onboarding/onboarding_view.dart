import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/authentication/mainAuth.dart';
import 'package:flutter_application_1/presentation/onboarding/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding_view extends StatefulWidget {
  const onboarding_view({super.key});

  @override
  State<onboarding_view> createState() => _onboarding_viewState();
}

class _onboarding_viewState extends State<onboarding_view> {
  var pagecon = PageController();
  int lastIndex = 0;
  final _ondourdingviewpages = const mainAuth();
  List<onboardingModel> onbourding = [
    onboardingModel(1,
        img: 'assets/d10.jpg', text: 'text', description: 'description'),
    onboardingModel(2,
        img: 'assets/d10.jpg', text: 'text', description: 'description'),
    onboardingModel(3,
        img: 'assets/d10.jpg', text: 'text', description: 'description'),
    onboardingModel(4,
        img: 'assets/d10.jpg', text: 'text', description: 'description'),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var pagecon = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'تخطي',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 63, 122, 168),
                    fontSize: 16,
                  ),
                )),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        lastIndex = value;
                      });
                    },
                    // scrollDirection: Axis.horizontal,
                    controller: pagecon,
                    itemCount: onbourding.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                onbourding[index].img,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Text(onbourding[index].text,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle()),
                              Text(onbourding[index].description),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                        controller: pagecon,
                        count: 4,
                        effect: const SwapEffect(), // your preferred effect
                        onDotClicked: (index) {}),
                    const Spacer(),
                    if (lastIndex == onbourding.length - 1)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const mainAuth(),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            // height: 55,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  Color(0xff0d47a1),
                                  Color(0xff1976d2),
                                  Color(0xff42a5f5)
                                ],
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              'تسوق الان',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
