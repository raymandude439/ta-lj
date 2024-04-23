import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Navigation extends ConsumerStatefulWidget {
  const Navigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: widget.navigationShell
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _goBranch(0);
                },
                child: SizedBox(
                  width: 82.w,
                  height: 58.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.batch_prediction,
                          size: 17.h,
                          color: widget.navigationShell.currentIndex == 0
                              ? Color(0xff02577A)
                              : Color(0xffA1A1AA)
                        ),
                        Text(
                          "Predict",
                          style: TextStyle(
                            color: widget.navigationShell.currentIndex == 0
                                ? Color(0xff02577A)
                                : Color(0xffA1A1AA),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff02577A).withOpacity(0.2), width: 2),
                  shape: BoxShape.circle,
                ),
                child: FittedBox(
                  child: FloatingActionButton.extended(
                      heroTag: 'externalAppsButton',
                      onPressed: () {},
                      shape: const CircleBorder(),
                      elevation: 0,
                      backgroundColor: Color(0xff02577A),
                      foregroundColor: Color(0xff02577A),
                      label: Icon(
                        Icons.model_training,
                        color: Colors.white,
                        size: 40.w,
                      )
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _goBranch(1);
                },
                child: SizedBox(
                  width: 82.w,
                  height: 58.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          size: 17.h,
                          color: widget.navigationShell.currentIndex == 1
                              ? Color(0xff02577A)
                              : Color(0xffA1A1AA),
                        ),
                        Text(
                          "Model Info",
                          style: TextStyle(
                            color: widget.navigationShell.currentIndex == 1
                                ? Color(0xff02577A)
                                : Color(0xffA1A1AA),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
