import 'package:flutter/material.dart';
import 'package:wallet/core/extension/appSize.dart';
import 'package:wallet/features/home/data/model/category_model.dart';
import 'package:wallet/features/home/presention/logic/bloc/mony_bloc.dart';
import 'package:wallet/core/style/color/appcolors.dart';
import 'package:wallet/core/widgets/boutton.dart';
import 'package:wallet/core/widgets/category_widget.dart';
import 'package:wallet/core/widgets/search_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/features/home/presention/ui/widgets/actionboutton_widget.dart';
import 'package:wallet/features/home/presention/ui/widgets/displayamount_widget.dart';
import 'package:wallet/features/home/presention/ui/widgets/functionaddandDvied.dart';
import 'package:wallet/features/home/presention/ui/widgets/splitmoney_widget.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MonyBloc()..add(getcategory()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<MonyBloc>();

          Future dividedMony(BuildContext context, MonyBloc bloc) => showDialog(
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
                        // if (state is AddmonySuccess) {
                        //   value = bloc.lastadd;
                        //   return SplitmoneyWidget(Value: value);
                        // } else if (state is supSuccess) {
                        //   // value = state.money!;
                        //   return SplitmoneyWidget(Value: bloc.lastadd);
                        // }
                        return SplitmoneyWidget(Value: value);
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: bloc.categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: CategoryWidget(
                              icon: bloc.categories[index].logo,
                              text: bloc.categories[index].categoryname,
                              categoryColor:
                                  bloc.categories[index].categoryColor,
                              w: 70,
                              h: 30,
                              ontap: () {
                                print(
                                  'here the name of category ${bloc.categories[index].categoryname}',
                                );
                                bloc.add(
                                  dividedmony(
                                    modesplit: bloc.dividedmonycontroller.text,
                                    categoryName:
                                        bloc.categories[index].categoryname,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    Boutton(
                      text: 'Done',
                      width: 20,
                      ouline: false,
                      backGroudcolor: Appcolors.basecolor,
                      onPressed: () {
                        bloc.dividedmonycontroller.clear();
                        Navigator.pop(context);
                        bloc.add(sumcategory());
                        print(bloc.category);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );

          Future _AddMonyDialog(BuildContext context, MonyBloc bloc) =>
              showDialog(
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
                        style: TextStyle(
                          fontSize: 20,
                          color: Appcolors.blakcolor,
                        ),
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
                          Navigator.pop(context);
                          bloc.add(addmony(mony: bloc.addmonycontroller.text));
                          dividedMony(context, bloc);
                        },
                      ),
                    ],
                  ),
                ),
              );

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Hi,' + name,
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
                          double displayamount = bloc.total;
                          return DisplayamountWidget(amount: displayamount);
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
                  const SizedBox(height: 12),

                  ActionbouttonWidget(
                    addmoneyaction: () => _AddMonyDialog(context, bloc),
                    transofermmoneyaction: () {},
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
                        if (state is categorystate) {
                          final categories = state.category;

                          if (categories.isEmpty) {
                            return Center(child: Text('No categories yet 😢'));
                          }

                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 24,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 1.3,
                                ),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final cat = categories[index];
                              return CategoryWidget(
                                icon: cat.logo,
                                text: cat.categoryname,
                                categoryColor: cat.categoryColor,
                                price: cat.amount,
                                h: 100,
                                w: 100,
                                ontap: () {},
                              );
                            },
                          );
                        }

                        if (state is categoryError ) {
                          return Center(child: Text('Error: ${state.message}'));
                        }

                        // الحالة المبدئية
                        return const Center(child: CircularProgressIndicator());
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
