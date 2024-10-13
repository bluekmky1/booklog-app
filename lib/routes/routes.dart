import 'route_info.dart';

class Routes {
  // auth
  static const RouteInfo auth = RouteInfo(
    name: '/auth',
    path: '/auth',
  );

  static const RouteInfo signIn = RouteInfo(
    name: '/auth/sign-in',
    path: 'sign-in',
  );

  static const RouteInfo signUp = RouteInfo(
    name: '/auth/sign-up',
    path: 'sign-up',
  );

  // 홈(메인)페이지
  static const RouteInfo home = RouteInfo(
    name: '/home',
    path: '/home',
  );

  static const RouteInfo user = RouteInfo(
    name: '/home/user',
    path: 'user',
  );

  static const RouteInfo bookReviewList = RouteInfo(
    name: '/home/book-review-list',
    path: 'book-review-list',
  );

  static const RouteInfo bookReview = RouteInfo(
    name: '/home/book-review-list/book-review',
    path: 'book-review',
  );
}
