import 'package:flutter/material.dart';
import 'package:wallet/extension/appSize.dart';
import 'package:wallet/model/category_model.dart';
import 'package:wallet/screens/bloc/mony_bloc.dart';
import 'package:wallet/style/color/appcolors.dart';
import 'package:wallet/widgets/boutton.dart';
import 'package:wallet/widgets/category_widget.dart';
import 'package:wallet/widgets/search_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key, required this.name});
  final String name; 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MonyBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<MonyBloc>();

          Future dividedMony() => showDialog(
            context: context,
            builder: (context) => BlocProvider.value(
              value: bloc,
              child: AlertDialog(
                backgroundColor: Appcolors.whitecolor,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text('split your mony'),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                            bloc.dividedmonycontroller.clear();
                          },
                        ),
                      ],
                    ),
                    BlocConsumer<MonyBloc, MonyState>(
                      listener: (context, state) {
                        if (state is supFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                        final bloc = context.read<MonyBloc>();
                        double value = bloc.lastadd;
                        if (state is AddmonySuccess) {
                          value = state.mony!;
                        } else if (state is supSuccess) {
                          value = state.money!;
                          return Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '${state.money}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Appcolors.blakcolor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }
                        return Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '${value}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Appcolors.blakcolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: bloc.dividedmonycontroller,
                        decoration: InputDecoration(
                          hint: Text('How much you add'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        ' To which Category ?',
                        style: TextStyle(
                          color: Appcolors.blakcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: context.getWidth(),
                      child: BlocBuilder<MonyBloc, MonyState>(
                        builder: (context, state) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: CategorythatAdd.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: CategoryWidget(
                                  icon: CategorythatAdd[index].icon,
                                  text: CategorythatAdd[index].text,
                                  categoryColor:
                                      CategorythatAdd[index].categoryColor,
                                  w: 70,
                                  h: 30,
                                  ontap: () {
                                    bloc.add(
                                      dividedmony(
                                        modesplit:
                                            bloc.dividedmonycontroller.text,
                                        categoryName:
                                            CategorythatAdd[index].text!,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Boutton(
                          text: 'Done',
                          width: 20,
                          ouline: false,
                          onPressed: () {
                            bloc.dividedmonycontroller.clear();
                            Navigator.pop(context);
                            bloc.add(sumcategory());
                            print(bloc.category);
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

          Future AddMonyDialog() => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Appcolors.whitecolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Enter your Salary below :",
                    style: TextStyle(fontSize: 20, color: Appcolors.blakcolor),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: bloc.addmonycontroller,
                      decoration: InputDecoration(
                        hint: Text('EX:2000'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Boutton(
                    text: 'ADD',
                    width: double.infinity,
                    backGroudcolor: Appcolors.basecolor,
                    ouline: false,
                    onPressed: () {
                      bloc.add(addmony(mony: bloc.addmonycontroller.text));
                      dividedMony();
                    },
                  ),
                ],
              ),
            ),
          );

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Hi,'+name, 
                style: TextStyle(color: Appcolors.blakcolor),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_on_outlined),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BlocBuilder<MonyBloc, MonyState>(
                        builder: (context, state) {
                          if (state is AddmonySuccess) {
                            return Text(
                              '  ${bloc.addmoney}',
                              style: TextStyle(
                                fontSize: 37,
                                fontWeight: FontWeight.bold,
                                color: Appcolors.blakcolor,
                              ),
                            );
                          }
                          return Text(
                            "${bloc.addmoney}",
                            style: TextStyle(
                              fontSize: 37,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.blakcolor,
                            ),
                          );
                        },
                      ),
                      Spacer(),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            label: Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                              color: Appcolors.blakcolor,
                            ),
                            icon: SvgPicture.asset(
                              "assets/icons/SAR.svg",
                              color: Appcolors.blakcolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Boutton(
                        text: 'Add mony',
                        backGroudcolor: const Color.fromARGB(
                          255,
                          180,
                          202,
                          159,
                        ),
                        width: context.getWidth() / 1.98,
                        icon: Icons.add,
                        ouline: false,
                        onPressed: AddMonyDialog,
                      ),
                      SizedBox(width: 20),
                      Boutton(
                        text: 'Transform',
                        backGroudcolor: Appcolors.baseligitcollor,
                        width: context.getWidth() / 2.6,
                        icon: Icons.arrow_outward_rounded,
                        ouline: false,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Boutton(
                    text: 'Financial  chart',
                    width: context.getWidth(),
                    icon: Icons.stacked_bar_chart_sharp,
                    bordarColor: Appcolors.basecolor,
                    ouline: true,
                    onPressed: () {},
                  ),
                  SizedBox(height: 12),
                  Text("What are you doing on this money ? "),
                  SizedBox(height: 12),
                  SearchWidget(onchange: (value) => {}),
                  SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<MonyBloc, MonyState>(
                      builder: (context, state) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 24,
                                crossAxisSpacing: 20,
                                childAspectRatio: 1.3,
                              ),
                          itemCount: CategorythatAdd.length,

                          itemBuilder: (context, index) {
                            print(CategorythatAdd.length);
                            return CategoryWidget(
                              icon: CategorythatAdd[index].icon,
                              text: CategorythatAdd[index].text,
                              categoryColor:
                                  CategorythatAdd[index].categoryColor,
                              price: CategorythatAdd[index].price,
                              h: 100,
                              w: 100,
                              ontap: () {},
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
