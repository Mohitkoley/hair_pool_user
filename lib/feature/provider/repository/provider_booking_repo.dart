import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:demandium/utils/core_export.dart';

class ProviderBookingRepo {
  final ApiClient apiClient;
  ProviderBookingRepo({required this.apiClient});


  Future<Response> getCategoryList() async {
    return await apiClient.getData('${AppConstants.categoryUrl}&limit=100&offset=1');
  }

  Future<Response> getProviderList(int offset,Map<String,dynamic> body, {int limit = 10}) async {
    return await apiClient.postData("${AppConstants.getProviderList}?limit=$limit&offset=$offset",body);
  }

  Future<Response> getProviderDetails(String providerId, int offset) async {
    return await apiClient.getData("${AppConstants.getProviderDetails}?id=$providerId&limit=10&offset=$offset");
  }

  Future<Response> updateIsFavoriteStatus({required String serviceId}) async {
    return await apiClient.postData(AppConstants.updateFavoriteProviderStatus,{
      "provider_id" : serviceId
    });
  }
}