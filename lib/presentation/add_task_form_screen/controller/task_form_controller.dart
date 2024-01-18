import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/task_form_model.dart';

class TaskFormController extends GetxController {
  TextEditingController taskNameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  Rx<TaskFormModel> TaskFormModelObj = TaskFormModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    taskNameController.dispose();
    descriptionController.dispose();
  }
}
