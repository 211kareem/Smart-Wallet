import 'package:smartwallet/models/dashboard/dashboard_response.dart';

class DashboardViewModel {
  List<DashBoardResponse> dashboardDispatchItems;

  DashboardViewModel({this.dashboardDispatchItems});

  getDashboard() => <DashBoardResponse>[
        DashBoardResponse(id: 1, title: 'USA', ratting: 2.7, totalItems: 2),
        DashBoardResponse(id: 2, title: 'China', ratting: 4.0, totalItems: 2),
        DashBoardResponse(id: 3, title: 'Italy', ratting: 4.5, totalItems: 2),
        DashBoardResponse(id: 4, title: 'Japan', ratting: 5.0, totalItems: 2),
        DashBoardResponse(id: 5, title: 'India', ratting: 3.7, totalItems: 2),
        DashBoardResponse(id: 6, title: 'France', ratting: 3.2, totalItems: 2),
        DashBoardResponse(id: 7, title: 'Germany', ratting: 5.0, totalItems: 2)
      ];
}
