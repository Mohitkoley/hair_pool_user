import 'package:demandium/api/client_api.dart';
import 'package:demandium/utils/app_constants.dart';
import 'package:get/get.dart';

class ServiceRepo extends GetxService {
  final ApiClient apiClient;
  ServiceRepo({required this.apiClient});

  Future<Response> getAllServiceList(int offset) async {
    return await apiClient
        .getData('${AppConstants.allServiceUri}?offset=$offset&limit=10');
  }

  Future<Response> ourProducts(int offset) async {
    return await apiClient
        .getData('${AppConstants.ourProducts}?offset=$offset&limit=10');
  }

  Future<Response> getPopularServiceList(int offset) async {
    return await apiClient
        .getData('${AppConstants.popularServiceUri}?offset=$offset&limit=10');
  }

  Future<Response> getTrendingServiceList(int offset) async {
    return await apiClient
        .getData('${AppConstants.trendingServiceUri}?offset=$offset&limit=10');
  }

  Future<Response> getRecentlyViewedServiceList(int offset) async {
    return await apiClient.getData(
        '${AppConstants.recentlyViewedServiceUri}?offset=$offset&limit=10');
  }

  Future<Response> getFeatheredCategoryServiceList() async {
    return await apiClient.getData(AppConstants.getFeaturedCategoryService);
  }

  Future<Response> getRecommendedServiceList(int offset) async {
    return await apiClient.getData(
        '${AppConstants.recommendedServiceUri}?limit=10&offset=$offset');
  }

  Future<Response> getRecommendedSearchList() async {
    return await apiClient.getData(AppConstants.recommendedSearchUri);
  }

  Future<Response> getOffersList(int offset) async {
    return await apiClient
        .getData('${AppConstants.offerListUri}?limit=10&offset=$offset');
  }

  Future<Response> getServiceListBasedOnSubCategory(
      {required String subCategoryID, required int offset}) async {
    return await apiClient.getData(
        '${AppConstants.serviceBasedOnSubcategory}$subCategoryID?limit=30&offset=$offset');
  }

  Future<Response> getItemsBasedOnCampaignId(
      {required String campaignID}) async {
    return await apiClient.getData(
        '${AppConstants.itemsBasedOnCampaignId}$campaignID&limit=100&offset=1');
  }

  Future<Response> updateIsFavoriteStatus({required String serviceId}) async {
    return await apiClient.postData(
        AppConstants.updateFavoriteServiceStatus, {"service_id": serviceId});
  }
}
