import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rgmcet_admin/app/common/constants/colors.dart';
import 'package:rgmcet_admin/app/common/constants/text_styles.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 60.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 225.h,
                    width: 240.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  Container(
                    height: 225.h,
                    width: 240.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              GetX<DashboardController>(builder: (context) {
                if (controller.outpasses.isNotEmpty) {
                  return DataTable(
                    columnSpacing: 40,
                    columns: [
                      DataColumn(
                        label: Text('Sr. No'),
                      ),
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Status'),
                      ),
                      DataColumn(
                        label: Text('From'),
                      ),
                      DataColumn(
                        label: Text('Time'),
                      ),
                      DataColumn(
                        label: Text('To'),
                      ),
                      DataColumn(
                        label: Text('Time'),
                      ),
                      DataColumn(
                        label: Text('Approved by Warden'),
                      ),
                      DataColumn(
                        label: Text('Reason'),
                      ),
                    ],
                    rows: buildRowOutpass(),
                  );
                }
                return SizedBox.shrink();
              }),
              SizedBox(
                height: 60.h,
              ),
              GetX<DashboardController>(builder: (context) {
                return DataTable(
                  columns: [
                    DataColumn(
                      label: Text('Name'),
                    ),
                    DataColumn(
                      label: Text('Status'),
                    ),
                    DataColumn(
                      label: Text('Hostel Name'),
                    ),
                  ],
                  rows: buildRowAttendence(),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> buildRowOutpass() {
    List<DataRow> rows = [];

    for (var i = 0; i < controller.outpasses.length; i++) {
      var outpass = controller.outpasses[i];
      rows.add(DataRow(
        cells: [
          DataCell(Text('00${outpass.srNo!}')),
          DataCell(Text(outpass.name!)),
          DataCell(Container(
            height: 35.h,
            width: 105.72.w,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                outpass.status!.name,
                style: MyTextStyle.buttonStyle,
              ),
            ),
          )),
          DataCell(Text(outpass.fromDate.toString().split(' ')[0])),
          DataCell(Text(outpass.fromTime!)),
          DataCell(Text(outpass.toDate.toString().split(' ')[0])),
          DataCell(Text(outpass.toTime!)),
          DataCell(Center(child: Text(outpass.toTime!))),
          DataCell(Text(outpass.reason!)),
        ],
      ));
    }

    return rows;
  }

  List<DataRow> buildRowAttendence() {
    List<DataRow> rows = [];

    for (var i = 0; i < controller.attendences.length; i++) {
      var attendece = controller.attendences[i];
      rows.add(DataRow(
        cells: [
          DataCell(Text(attendece.studentName!)),
          DataCell(Text(attendece.isPresent.toString())),
          DataCell(Text(attendece.hostelName!)),
        ],
      ));
    }

    return rows;
  }
}
