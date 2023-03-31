import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  final String title;
  final String subTitle;
  final String image;

  const PageContent({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  List<Object> get props => [title, subTitle, image];
}

List<PageContent> pageData = [
  const PageContent(
    title: 'Welcome..!',
    subTitle:
        "Welcome to Planta! In just a few easy steps, you'll be on your way to cultivating your very own indoor garden. Let's get started by creating your account and adding your first plant.",
    image: 'assets/images/onboarding1.png',
  ),
  const PageContent(
    title: 'Your Personal Plant Care Assistant',
    subTitle:
        'Ready to bring a little green into your life? With Planta, you can easily track your plant care and receive helpful reminders to keep your plants thriving. Let\'s begin by exploring our collection of plants and choosing the perfect one to add to your collection.',
    image: 'assets/images/onboarding1.png',
  ),
  const PageContent(
    title: 'plant care management',
    subTitle:
        'With Planta, you\'ll never have to worry about forgetting to water your plants again. Our app will help you keep track of all your plant care needs, so you can enjoy a healthy and vibrant indoor garden. To get started, let\'s set up your profile and add your first plant to your collection.',
    image: 'assets/images/onboarding1.png',
  ),
];
