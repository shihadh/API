import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/api_controller.dart';
import 'package:todo/utils/constants.dart';

ElevatedButton filterButton({required String title,required VoidCallback function,required Color color}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      backgroundColor: AppColor.backgroundContainer,
    ),
    onPressed:function,
    child: Text(title, style: TextStyle(color: color)),
  );
}

dialogbox(context, userIdcontroller, titlecontroller) {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: AppColor.backgroundColor,
          title: Text(AppConstants.atertTitle),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 3,
                  color: AppColor.backgroundColor,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        field(title: AppConstants.atertTextField1,contoller: userIdcontroller,type: TextInputType.number),
                        SizedBox(height: 15),
                        field(title: AppConstants.atertTextField2, contoller: titlecontroller,type: TextInputType.text),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppConstants.filter2),
                              Switch(
                                inactiveTrackColor: AppColor.backgroundColor,
                                activeTrackColor: AppColor.backgroundColor,
                                activeColor: AppColor.success,
                                focusColor: AppColor.backgroundColor,
                                value: context.watch<ApiController>().swichvalue, onChanged: (val){
                                  Provider.of<ApiController>(context,listen: false).swichtoggle(val);
                                })
                            ],
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                 Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                    },
                                    child: Text(AppConstants.atertbtn1,style: TextStyle(color: AppColor.primary),),),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      backgroundColor: AppColor.primary,
                                    ),
                                    onPressed: (){
                                      var val=Provider.of<ApiController>(context,listen: false).swichvalue;
                                      context.read<ApiController>().addDAta(val);
                                      Navigator.pop(context);

                                    }, child: Text(AppConstants.atertbtn2,style: TextStyle(color: AppColor.backgroundColor)))
                                ],
                        )
              ],
            ),
          ],
        ),
  );
}

TextField field({
  required String title,
  required TextEditingController contoller,
   TextInputType? type
}) {
  return TextField(
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(204, 247, 246, 246),
                          filled: true,
                          hintText: title,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none
                          )
                        ),
                        controller: contoller,
                        keyboardType: type,
                      );
}


updatedDialogbox(context, userIdcontroller, titlecontroller, userIdUpdateContropller, titleUpdateContropller,stat,index) {

  var controller = Provider.of<ApiController>(context, listen: false);
  controller.userIdUpdateContropller.text = controller.tododata[index].userId.toString();
  controller.titleUpdateContropller.text = controller.tododata[index].title.toString();

  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: AppColor.backgroundColor,
          title: Text(AppConstants.atertupdateTitle),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 3,
                  color: AppColor.backgroundColor,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        field(title: AppConstants.atertTextField1,contoller: userIdUpdateContropller,type: TextInputType.number),
                        SizedBox(height: 15),
                        field(title: AppConstants.atertTextField2, contoller: titleUpdateContropller,type: TextInputType.text),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppConstants.filter2),
                              Switch(
                                inactiveTrackColor: AppColor.backgroundColor,
                                activeTrackColor: AppColor.backgroundColor,
                                activeColor: AppColor.success,
                                focusColor: AppColor.backgroundColor,
                                value: context.watch<ApiController>().swichvalue, onChanged: (val){
                                  Provider.of<ApiController>(context,listen: false).swichtoggle(val);
                                })
                            ],
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                 Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                    },
                                    child: Text(AppConstants.atertbtn1,style: TextStyle(color: AppColor.primary),),),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      backgroundColor: AppColor.primary,
                                    ),
                                    onPressed: (){
                                      var val=Provider.of<ApiController>(context,listen: false);
                                      context.read<ApiController>().updateTodofn(
                                        val.userIdcontroller,
                                        val.titleContropller,
                                        val.tododata[index].id,
                                        val.userIdUpdateContropller.text,
                                        val.titleUpdateContropller.text,
                                        val.swichvalue
                                        );
                                        
                                      Navigator.pop(context);

                                    }, child: Text(AppConstants.atertupdatebtn2,style: TextStyle(color: AppColor.backgroundColor)))
                                ],
                        )
              ],
            ),
          ],
        ),
  );
}
