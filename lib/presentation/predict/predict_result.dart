import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PredictResultPage extends ConsumerStatefulWidget {
  const PredictResultPage({super.key, required this.result});

  final List<String> result;

  @override
  ConsumerState<PredictResultPage> createState() => _PredictResultPageState();
}

class _PredictResultPageState extends ConsumerState<PredictResultPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            widget.result[0],
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
                    'Here is the result of your prediction',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.result[1]} :  ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.result[2],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )));
  }
}
