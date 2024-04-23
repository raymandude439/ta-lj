import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tugas_akhir_lj/core/providers/ai_models_provider.dart';
import 'package:tugas_akhir_lj/core/routes/route_name.dart';

class PredictPage extends ConsumerStatefulWidget {
  const PredictPage({super.key});

  @override
  ConsumerState<PredictPage> createState() => _PredictPageState();
}

List<String> filter = <String>[
  'Newest - Oldest',
  'Oldest - Newest',
  'A - Z',
  'Z - A',
];

class _PredictPageState extends ConsumerState<PredictPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allAiModels = ref.watch(aiModelsProvider);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            "Predict",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DropdownMenu(
                trailingIcon: Icon(
                  Icons.arrow_drop_down,
                  size: 20.w,
                  color: Colors.white,
                ),
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                width: 100.w,
                initialSelection: filter.first,
                onSelected: (value) {},
                dropdownMenuEntries:
                    filter.map<DropdownMenuEntry<String>>((String e) {
                  return DropdownMenuEntry<String>(
                    value: e,
                    label: e,
                  );
                }).toList(),
              ),
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Color(0xff02577A)),
          ),
        ),
        body: allAiModels.maybeWhen(
          data: (data) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      ref.context.goNamed(RouteName.predictInput, extra: data[index]);
                    },
                    child: Container(
                      width: 1.sw,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index].modelName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black),
                              ),
                              Text(
                                DateFormat('d MMMM yyyy')
                                    .format(data[index].dateCreated),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    color: Color(0xff02577A)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  data[index].description,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                      color: Color(0xff585858)),
                                ),
                              ),
                              Text(
                                '0.9',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    color: Color(0xff02577A)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 1.h,
                        color: Color(0xffA9A9A9),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemCount: data.length,
              ),
            );
          },
          orElse: () {
            return Padding(
                padding: EdgeInsets.all(20),
                child: Shimmer.fromColors(
                    baseColor: Color(0xffA9A9A9),
                    highlightColor: Color(0xffF5F5F5),
                    child: Container(
                      height: 1.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Color(0xffA9A9A9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )));
          },
        ));
  }
}
