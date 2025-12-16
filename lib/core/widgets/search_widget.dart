import 'package:flutter/material.dart';
import 'package:wallet/core/style/color/appcolors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key, required this.onchange});
final ValueChanged onchange; 

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: 
      SearchBar( 
      trailing: const [
        Icon(
      Icons.search, 
        color: Appcolors.blakcolor,)
      ],
      hintText: 'Search',
      hintStyle:WidgetStatePropertyAll(TextStyle(color: Appcolors.blakcolor, fontSize: 18)) ,
      elevation: const WidgetStatePropertyAll(0.5),
      backgroundColor: const WidgetStatePropertyAll(Appcolors.greycolor) ,
        shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        onChanged: widget.onchange,
      ),
   
    );
  }
}

