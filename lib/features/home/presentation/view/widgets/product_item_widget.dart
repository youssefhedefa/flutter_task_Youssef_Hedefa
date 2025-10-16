import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/widgets/custom_svg_builder.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/add_to_cart_button_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/favorite_button_widget.dart';
import 'package:flutter_task/generated/assets.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textStyle = context.appTextStyles;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: appColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          ColoredBox(
            color: appColors.borderColor.withValues(alpha: .05),
            child: Image.asset(Assets.imagesSweetShirt),
          ),
          4.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'جاكيت من الصوف مناسب',
                          style: textStyle.font14Medium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const CustomSvgBuilder(
                        path: Assets.iconsOffer,
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: '32,000,000جم',
                            style: textStyle.font14MediumRedColor,
                            children: <TextSpan>[
                              TextSpan(
                                text: '60,000,000جم',
                                style: textStyle.font12Regular,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const FavoriteButtonWidget(),
                    ],
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      const CustomSvgBuilder(
                        path: Assets.iconsSellesCount,
                        height: 14,
                        width: 14,
                      ),
                      4.horizontalSpace,
                      Text(
                        'تم بيع 3.3k+',
                        style: textStyle.font10RegularGreyColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      4.horizontalSpace,
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            backgroundColor: appColors.primaryColor.withValues(
                              alpha: 0.1,
                            ),
                            child: Icon(
                              Icons.domain,
                              color: appColors.primaryColor,
                              size: 18,
                            ),
                          ),
                          PositionedDirectional(
                            start: -6,
                            top: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: appColors.primaryColor,
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const AddToCartButtonWidget(),
                      12.horizontalSpace,
                      Image.asset(
                        Assets.imagesProductImg,
                      ),
                    ],
                  ),
                  8.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
