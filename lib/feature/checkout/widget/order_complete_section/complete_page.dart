import 'package:demandium/utils/core_export.dart';
import 'package:get/get.dart';

class CompletePage extends StatelessWidget {
  final String? token;

  const CompletePage({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80.0,
            ),
            GetBuilder<CheckOutController>(builder: (controller) {
              return Column(children: [
                Text(
                  controller.isPlacedOrderSuccessfully
                      ? "booking_placed_successfully".tr
                      : 'your_bookings_is_failed_to_place'.tr,
                  style: ubuntuMedium.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                      color: controller.isPlacedOrderSuccessfully
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.error),
                ),
                if (controller.bookingReadableId.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.paddingSizeDefault),
                    child: Text(
                      "${'booking_id'.tr} ${controller.bookingReadableId}",
                      style: ubuntuMedium.copyWith(
                          fontSize: Dimensions.fontSizeExtraLarge,
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                    ),
                  ),
                const SizedBox(
                  height: Dimensions.paddingSizeExtraMoreLarge,
                ),
                Image.asset(
                  Images.orderComplete,
                  scale: 3.5,
                ),
                if (ResponsiveHelper.isWeb())
                  const SizedBox(
                    height: Dimensions.paddingSizeExtraMoreLarge,
                  )
              ]);
            }),
          ],
        ),
      ),
    );
  }
}
