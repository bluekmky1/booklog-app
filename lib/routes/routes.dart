import 'route_info.dart';

class Routes {
  // 홈(메인)페이지
  static const RouteInfo home = RouteInfo(
    name: '/home',
    path: '/home',
  );

  static const RouteInfo user = RouteInfo(
    name: '/home/user',
    path: 'user',
  );

  static const RouteInfo bookReview = RouteInfo(
    name: '/home/book-review',
    path: 'book-review',
  );
}
