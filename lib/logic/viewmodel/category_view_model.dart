import 'package:smartwallet/models/category/category_response.dart';

class CategoryViewModel {
  getCategory() => <CategoryResponse>[
        CategoryResponse(id: 1, dashboardId: 1, title: 'Refinery Hotel - New York ', ratting: 8.8, dollarPrice: 150.0, weight:'price/day'),
        CategoryResponse(id: 2, dashboardId: 1, title: 'MOXY NYC Times Square', ratting:8.5, dollarPrice: 120.0, weight: 'price/day'),

        CategoryResponse(id: 3, dashboardId: 2, title: 'Guangzhou Baiyun Hotel', ratting: 7.9, dollarPrice: 30.0, weight:'price/day'),
        CategoryResponse(id: 4, dashboardId: 2, title: 'Pullman Guangzhou Baiyun Airport', ratting:8.6, dollarPrice: 80.0, weight:'price/day'),

        CategoryResponse(id: 5, dashboardId: 3, title: 'Laguna Palace Hotel Grado', ratting: 8.9, dollarPrice: 300.0, weight:'price/day'),
        CategoryResponse(id: 6, dashboardId: 3, title: 'Idea Hotel Milano Malpensa Airport', ratting: 7.9, dollarPrice: 230.0, weight:'price/day '),

        CategoryResponse(id: 7, dashboardId: 4, title: 'The Millennials Shibuya', ratting: 9.1, dollarPrice: 210.0, weight:'price/day '),
        CategoryResponse(id: 8, dashboardId: 4, title: 'The Royal Park Hotel Tokyo Haneda', ratting: 8.6, dollarPrice: 50.0, weight:'price/day '),

       CategoryResponse(id: 9, dashboardId: 5, title: 'The Leela Ambience Gurgaon Hotel & Residences', ratting: 8.8, dollarPrice: 20.0, weight:'price/day '),
       CategoryResponse(id: 10,dashboardId: 5, title: 'Marari Beach - CGH Earth', ratting: 8.9, dollarPrice: 25.0, weight:'price/day'),

       CategoryResponse(id: 11, dashboardId: 6, title: 'Langley Hôtel Tignes 2100', ratting: 8.8, dollarPrice: 600.0, weight:'price/day '),
       CategoryResponse(id: 12, dashboardId: 6, title: 'Chalet Monte Bianco', ratting: 9.6, dollarPrice: 1000.0, weight:'price/day '),

       CategoryResponse(id: 13, dashboardId: 7, title: 'Maritim Airport Hotel Hannover', ratting: 8.5, dollarPrice: 110.0, weight:'price/day '),
       CategoryResponse(id: 14, dashboardId: 7, title: 'Vier Jahreszeiten Kempinski München', ratting: 8.8, dollarPrice: 136.0, weight:'price/day '),

      ];
}
