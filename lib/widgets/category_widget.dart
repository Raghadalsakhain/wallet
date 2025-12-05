import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/style/color/appcolors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    this.text,
    this.price,
    required this.icon,
    this.categoryColor, required this.h, required this.w, required this.ontap,
  });
  final String? text;
  final double? price;
  final String icon;
  final Color? categoryColor;
  final double h; 
  final double w; 
  final VoidCallback ontap; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap, 
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: icon.isNotEmpty&&text==null
            ? Center(
              child:Icon(Icons.add,size: 50,color: Appcolors.blakcolor,)
              )
            : Padding(
              padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                price==null? SvgPicture.asset(icon, height: 22,width:20 ,):SvgPicture.asset(icon, height: 40,width:40 ,), 
                price==null?SizedBox(height: 10,): SizedBox(height: 18,), 
                  price==null?  Text(text ?? '',style: TextStyle(color: Appcolors.blakcolor,fontSize: 10,overflow: TextOverflow.ellipsis),):Text(text ?? '',style: TextStyle(color: Appcolors.blakcolor,fontSize: 18,overflow: TextOverflow.ellipsis),),
                    if(price !=null)...[
                   Spacer(), 
                    Row(
                      children: [
                        Text("${price}",style: TextStyle(color: Appcolors.blakcolor, fontSize: 18, fontWeight: FontWeight.w500),),
                        Spacer(),
                        SvgPicture.asset("assets/icons/SAR.svg", height: 30,width:30 ,),                  ],
                    ),
                    ]
                  ],
                ),
            ),
      ),
    );
  }
}
