import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/widgets/app_bar/appbar_image.dart';
import 'package:todo_app/widgets/app_bar/appbar_title.dart';
import 'package:todo_app/widgets/app_bar/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_floating_button.dart';

import '../../data/models/task.dart';
import '../../main.dart';
import '../../theme/app_style.dart';
import '../../theme/colors.dart';
import '../../theme/constanst.dart';
import '../../theme/strings.dart';
import '../../widgets/task_widget.dart';
import 'controller/task_list_controller.dart';

class MyTaskScreen extends GetWidget<MyTaskController> {
  TextEditingController taskTitleController = new TextEditingController();
  TextEditingController taskDescriptionController = new TextEditingController();

  TextEditingController taskController = new TextEditingController();

  DateTime today = DateTime.now().toUtc();

  String getCurrentDayOfWeek() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE').format(now);
    return formattedDate;
  }

  /// Checking Done Tasks
  int checkDoneTask(List<Task> task) {
    int i = 0;
    for (Task doneTasks in task) {
      if (doneTasks.isCompleted) {
        i++;
      }
    }
    return i;
  }

  /// Checking The Value Of the Circle Indicator
  dynamic valueOfTheIndicator(List<Task> task) {
    if (task.isNotEmpty) {
      return task.length;
    } else {
      return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: ColorConstant.gray50,
          appBar: CustomAppBarWithBottomBar(
              height: getVerticalSize(200),
              leadingWidth: 40,
              leading: AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 16, top: 12, bottom: 17),
                  onTap: () {
                    onTapArrowleft1();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "My Tasks"),
              bottom: TabBar(unselectedLabelColor: Colors.white60, tabs: [
                Tab(
                  icon: Icon(Icons.pending_actions),
                  text: 'Pending Actions',
                ),
                Tab(
                  icon: Icon(Icons.calendar_view_week),
                  text: 'Weekly Actions',
                ),
              ]),
              actions: [
                AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgOverflowmenu1,
                    margin: getMargin(left: 16, top: 12, right: 16, bottom: 17))
              ]),
          body: TabBarView(
            children: [
              Center(
                  child: ValueListenableBuilder(
                      valueListenable: base.dataStore.listenToTask(),
                      builder: (ctx, Box<Task> box, Widget? child) {
                        var tasks = box.values.toList();

                        /// Sort Task List
                        tasks.sort(((a, b) =>
                            a.createdAtDate.compareTo(b.createdAtDate)));
                        return _buildBody(tasks, base, textTheme);
                      })),
              Center(
                child: SingleChildScrollView(
                  child: Container(
                      width: double.maxFinite,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 16, top: 24),
                                    child: Text("This Week".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtGilroySemiBold20))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 16, top: 31),
                                    child: Text(
                                        "${getCurrentDayOfWeek()} ${today.day}th",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtGilroySemiBold16BlueA700))),
                            Container(
                                margin: getMargin(left: 16, top: 18, right: 16),
                                padding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                decoration: AppDecoration.outlineGray70011
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder6),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 3, bottom: 1),
                                          child: Text("Buy groceries",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtGilroySemiBold16Gray90001)),
                                      CustomButton(
                                          height: getVerticalSize(23),
                                          width: getHorizontalSize(85),
                                          text: "High Priority".tr,
                                          margin: getMargin(bottom: 1),
                                          variant: ButtonVariant.FillGray100,
                                          fontStyle:
                                              ButtonFontStyle.GilroyMedium12)
                                    ])),
                            Container(
                                margin: getMargin(left: 16, top: 16, right: 16),
                                padding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                decoration: AppDecoration.outlineGray70011
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder6),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 2, bottom: 1),
                                          child: Text("Cardio at 6pm ".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtGilroySemiBold16Gray90001)),
                                      CustomButton(
                                          height: getVerticalSize(23),
                                          width: getHorizontalSize(81),
                                          text: "Low Priority".tr,
                                          margin: getMargin(bottom: 1),
                                          variant: ButtonVariant
                                              .FillDeeporangeA10033,
                                          fontStyle: ButtonFontStyle
                                              .GilroyMedium12Deeporange400)
                                    ])),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 16, top: 24),
                                    child: Text("Next Week".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtGilroySemiBold20))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 16, top: 28),
                                    child: Text("Wednesday 14th".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtGilroySemiBold16BlueA700))),
                            Container(
                                margin: getMargin(left: 16, top: 17, right: 16),
                                padding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                decoration: AppDecoration.outlineGray70011
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder6),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 1, bottom: 2),
                                          child: Text("Dinner with fam ".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtGilroySemiBold16Gray90001)),
                                      CustomButton(
                                          height: getVerticalSize(23),
                                          width: getHorizontalSize(85),
                                          text: "High Priority".tr,
                                          margin: getMargin(bottom: 1),
                                          variant: ButtonVariant.FillGray100,
                                          fontStyle:
                                              ButtonFontStyle.GilroyMedium12)
                                    ])),
                            Container(
                                margin: getMargin(
                                    left: 16, top: 16, right: 16, bottom: 377),
                                padding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                decoration: AppDecoration.outlineGray70011
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder6),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 2, bottom: 1),
                                          child: Text("Pay my clg fees".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtGilroySemiBold16Gray90001)),
                                      CustomButton(
                                          height: getVerticalSize(23),
                                          width: getHorizontalSize(81),
                                          text: "Low Priority".tr,
                                          margin: getMargin(bottom: 1),
                                          variant: ButtonVariant
                                              .FillDeeporangeA10033,
                                          fontStyle: ButtonFontStyle
                                              .GilroyMedium12Deeporange400)
                                    ]))
                          ])),
                ),
              ),
            ],
          ),
          floatingActionButton: CustomFloatingButton(
            height: 60,
            width: 60,
            child: const Icon(Icons.add),
            onTap: () {
              Get.toNamed(AppRoutes.taskFormScreen);
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         scrollable: true,
              //         title: const Text(
              //           'Create your new task: ',
              //           style: TextStyle(fontSize: 15),
              //         ),
              //         content: Padding(
              //           padding: const EdgeInsets.all(6),
              //           child: TextField(
              //             controller: taskController,
              //           ),
              //         ),
              //         actions: [
              //           ElevatedButton(
              //               onPressed: () {}, child: const Text('Add'))
              //         ],
              //       );
              //     });
            },
          )),
    ));
  }

  onTapArrowleft1() {
    Get.back();
  }

  SizedBox _buildBody(
    List<Task> tasks,
    BaseWidget base,
    TextTheme textTheme,
  ) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          /// Top Section Of Home page : Text, Progrss Indicator
          Container(
            margin: const EdgeInsets.fromLTRB(55, 0, 0, 0),
            width: double.infinity,
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// CircularProgressIndicator
                SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    valueColor:
                        const AlwaysStoppedAnimation(MyColors.primaryColor),
                    backgroundColor: Colors.grey,
                    value: checkDoneTask(tasks) / valueOfTheIndicator(tasks),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),

                /// Texts
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(MyString.mainTitle, style: textTheme.headline1),
                    const SizedBox(
                      height: 3,
                    ),
                    Text("${checkDoneTask(tasks)} of ${tasks.length} task",
                        style: textTheme.subtitle1),
                  ],
                )
              ],
            ),
          ),

          /// Divider

          /// Bottom ListView : Tasks
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: tasks.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        var task = tasks[index];

                        return Dismissible(
                          direction: DismissDirection.horizontal,
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(MyString.deletedTask,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                          onDismissed: (direction) {
                            base.dataStore.dalateTask(task: task);
                          },
                          key: Key(task.id),
                          child: TaskWidget(
                            task: tasks[index],
                          ),
                        );
                      },
                    )

                  /// if All Tasks Done Show this Widgets
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Lottie
                        FadeIn(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Lottie.asset(
                              lottieURL,
                              animate: tasks.isNotEmpty ? false : true,
                            ),
                          ),
                        ),

                        /// Bottom Texts
                        FadeInUp(
                          from: 30,
                          child: const Text(MyString.doneAllTask),
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
