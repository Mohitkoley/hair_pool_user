// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:demandium/utils/core_export.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BookingItemCard extends StatelessWidget {
  final BookingModel bookingModel;
  final int index;
  const BookingItemCard({super.key, required this.bookingModel, required this.index}) ;

  @override
  Widget build(BuildContext context) {
    String bookingStatus = bookingModel.bookingStatus!;
    return InkWell(
      onTap: () => Get.toNamed(RouteHelper.getBookingDetailsScreen(bookingModel.id!,"",'others')),

      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor , borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.3)),
          boxShadow: Get.find<ThemeController>().darkTheme ? null : searchBoxShadow
        ),//boxShadow: shadow),
        padding:  const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall,horizontal: Dimensions.paddingSizeDefault),
        margin:  const EdgeInsets.symmetric(horizontal: 0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            Row(
           
               children: [
              Expanded(child: Text('${'booking'.tr}# ${bookingModel.readableId}', style: ubuntuBold.copyWith())),

              Directionality(
                textDirection: TextDirection.ltr,
                child: 
               Column(
                  children: [
                   bookingModel.bookingStatus == "pending" ? IconButton(

                        onPressed: () {
                          Get.bottomSheet(Container(
                              // ignore: prefer_const_constructors
                              height: 280,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('${'booking'.tr}# ${bookingModel.readableId}', style: ubuntuBold.copyWith()),
                              //   Text('${'booking'.tr}# ${bookingModel.bookingStatus}', style: ubuntuBold.copyWith()),
                                  QrImageView(
                              data: '${bookingModel.id}',
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                                                            ],
                              )));
                        },
                        icon: Icon(Icons.qr_code_2_rounded, size: 32,)) : Offstage(),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      PriceConverter.convertPrice(
                          bookingModel.totalBookingAmount!.toDouble()),
                      style: ubuntuBold.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ) 
              ),
            ]),
           // const SizedBox(height: Dimensions.paddingSizeEight,),

            Row( children: [
              Text('${'booking_date'.tr} : ', style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.6))),
              Text(DateConverter.dateMonthYearTimeTwentyFourFormat(DateConverter.isoUtcStringToLocalDate(bookingModel.createdAt.toString())),textDirection: TextDirection.ltr,
                    style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.6))),],),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

            Row( children: [
              Text('${'service_date'.tr} : ', style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.6))),
              Text(DateConverter.dateMonthYearTimeTwentyFourFormat(DateTime.tryParse(bookingModel.serviceSchedule!)!),
                style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.6)),
                textDirection: TextDirection.ltr,
              ),
            ],),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  color: bookingStatus=="ongoing" ? Theme.of(context).colorScheme.primary.withOpacity(.2):
                  bookingStatus=="pending" ? Theme.of(context).colorScheme.primary.withOpacity(.2):
                  bookingStatus=="accepted" ? Theme.of(context).colorScheme.primary.withOpacity(.2):
                  bookingStatus=="completed" ? Colors.green.withOpacity(.2) :
                  Theme.of(context).colorScheme.error.withOpacity(.2),
                ),
                child: Padding(padding:  const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeExtraSmall),
                  child: Center(
                    child: Text(bookingStatus.tr,
                      style:ubuntuMedium.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: bookingStatus=="ongoing" ? Theme.of(context).colorScheme.primary:
                        bookingStatus=="pending" ? Get.isDarkMode ? Theme.of(context).secondaryHeaderColor :
                        Theme.of(context).colorScheme.primary :
                        bookingStatus=="accepted" ? Theme.of(context).colorScheme.primary:
                        bookingStatus=="completed" ? Colors.green: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ),
              ),

              bookingStatus == "completed" ? GetBuilder<ServiceBookingController>(
                builder: (serviceBookingController) {
                  return InkWell(
                    onTap: serviceBookingController.isLoading ? () {} : () {
                      serviceBookingController.updateRebookIndex(index);
                      serviceBookingController.checkCartSubcategory(bookingModel.id!, bookingModel.subCategoryId!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                          border: Border.all(color: Theme.of(context).colorScheme.primary)
                      ),
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeEight, horizontal: Dimensions.paddingSizeLarge),
                      child: (serviceBookingController.selectedRebookIndex == index && serviceBookingController.isLoading) ?
                      const Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault) ,child: SizedBox(height: 15, width:15, child: CircularProgressIndicator())) :
                      Text("rebook".tr, style: ubuntuMedium.copyWith(color: Theme.of(context).colorScheme.primary),),
                    ),
                  );
                }
              ) : const SizedBox(),
            ],),
          ],
        ),
      ),
    );
  }
}
