import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tugas_akhir_lj/data/models/ai_models.dart';

class PredictInputPage extends ConsumerStatefulWidget {
  const PredictInputPage({super.key, required this.modelData});

  final AiModels modelData;

  @override
  ConsumerState<PredictInputPage> createState() => _PredictInputPageState();
}

class _PredictInputPageState extends ConsumerState<PredictInputPage> {
  final textInputs = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            widget.modelData.modelName,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Color(0xff02577A)),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.05.sh),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Please enter the required data accordingly to predict',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 1.sw,
              height: 1.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.allow(RegExp(r'.')),
                          ],
                          controller: textInputs[index],
                          decoration: InputDecoration(
                            hintText:
                                'Enter value of ${widget.modelData.listRegressionCoefficient[index].columnName}',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              color: Color(0xff585858),
                            ),
                            label: Text(
                              widget.modelData.listRegressionCoefficient[index]
                                  .columnName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color(0xff585858),
                                width: 1,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount:
                          widget.modelData.listRegressionCoefficient.length),
                  SizedBox(height: 10,),
                  InkWell(
                    child: Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Color(0xff02577A),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Predict',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
