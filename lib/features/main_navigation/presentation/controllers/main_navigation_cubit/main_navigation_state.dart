part of 'main_navigation_cubit.dart';

class MainNavigationState extends Equatable {
  final int currentIndex;
  final List<Widget> views;

  const MainNavigationState({
    this.currentIndex = 0,
    this.views = const [
      HomeView(),
      Center(child: Text('Search View')),
      Center(child: Text('Add View')),
      Center(child: Text('Notifications View')),
      Center(child: Text('Profile View')),
    ],
  });


  MainNavigationState copyWith({
    int? currentIndex,
  }) {
    return MainNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      views: views,
    );
  }

  @override
  List<Object?> get props => [currentIndex, views];
}
