import 'package:flowers/core/assets_util.dart';

class OnboardModel {
  final String title;
  final String bodyImage;
  final String backgroundImage;

  OnboardModel({
    required this.title,
    required this.bodyImage,
    required this.backgroundImage,
  });
}

final List<OnboardModel> onboardData = [
  OnboardModel(
    title: 'Donuts',
    bodyImage: AssetsUtil.oneBoardBody,
    backgroundImage: AssetsUtil.oneBoard,
  ),
  OnboardModel(
    title: 'Piece of cake',
    bodyImage: AssetsUtil.twoBoardBody,
    backgroundImage: AssetsUtil.twoBoard,
  ),
  OnboardModel(
    title: 'Milkshake',
    bodyImage: AssetsUtil.thereBoardBody,
    backgroundImage: AssetsUtil.threeBoard,
  ),
];
