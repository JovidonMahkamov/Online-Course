abstract class HomeEvent {
  const HomeEvent();
}

// ! Courses
class GetPopularCourses extends HomeEvent {
  final int limit;
  final int? categoryId;

  GetPopularCourses({required this.limit, this.categoryId});
}

class GetSingleCourseEvent extends HomeEvent {
  final int id;

  GetSingleCourseEvent({required this.id});
}

// ! Category
class GetCategoriesEvent extends HomeEvent {
  final int limit;

  GetCategoriesEvent({required this.limit});
}

// ! Mentors
class GetTopMentors extends HomeEvent {
  final int limit;

  GetTopMentors({required this.limit});
}

class GetMentors extends HomeEvent {
  final int limit;

  GetMentors({required this.limit});
}

// ! Wishlist

class GetWishlistEvent extends HomeEvent {
  final int limit;
  final int? categoryId;

  GetWishlistEvent({required this.limit,  this.categoryId});
}

class AddToWishlistEvent extends HomeEvent {
  final int courseId;

  AddToWishlistEvent({required this.courseId});
}

class RemoveFromWishlistEvent extends HomeEvent {
  final int courseId;

  RemoveFromWishlistEvent({required this.courseId});
}

// ! Search
class SearchEvent extends HomeEvent {
  final String query;

  SearchEvent({required this.query});
}

// ! Notification
class GetNotificationEvent extends HomeEvent {
  const GetNotificationEvent();
}
