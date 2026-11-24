import 'package:app_islame/core/constants/app_assets.dart';

class IntroPageData {
  final String image;
  final String title;
  final String? description;

  const IntroPageData({
    required this.image,
    required this.title,
    this.description,
  });
}

const List<IntroPageData> introPages = [
  IntroPageData(
    image: AppAssets.intro1,
    title: 'Welcome To Islami App',
  ),
  IntroPageData(
    image: AppAssets.intro2,
    title: 'Welcome To Islami',
    description: 'We Are Very Excited To Have You In Our Community',
  ),
  IntroPageData(
    image: AppAssets.intro3,
    title: 'Reading the Quran',
    description: 'Read, and your Lord is the Most Generous',
  ),
  IntroPageData(
    image: AppAssets.intro4,
    title: 'Bearish',
    description: 'Praise the name of your Lord, the Most High',
  ),
  IntroPageData(
    image: AppAssets.intro5,
    title: 'Holy Quran Radio',
    description:
    'You can listen to the Holy Quran Radio through the application for free and easily',
  ),
];