import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/api_controller.dart';
import 'package:todo/controller/filter_controller.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/views/home/home_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiController>(context,listen: false).getData();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColor.transparant ,
        elevation: 0,
        title: Text(AppConstants.appname,
        style: GoogleFonts.aBeeZee(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColor.backgroundContainer,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.person_outline,color: AppColor.normal,)),),
          )
        ],
      ),
      body: Consumer2<FilterController,ApiController>(
        
        builder: (context, value, value2, child) {
          final todos = value.filteredTodos;
          return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchBar(
                elevation: WidgetStatePropertyAll(2),
                leading: Icon(Icons.search,size: 35,color: Colors.grey,),
                hintText: AppConstants.searchBar,
                backgroundColor: WidgetStatePropertyAll(AppColor.backgroundColor),
                surfaceTintColor: WidgetStatePropertyAll(AppColor.transparant),
                onChanged: (val) => value.searchText =val,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  filterButton(title: AppConstants.filter1,color: value.btn1Color ,function:() {
                    value.all();
                    }),
                  filterButton(title: AppConstants.filter2,color: value.btn2Color,function: (){
                    value.complete();
                    }),
                  filterButton(title: AppConstants.filter3,color: value.btn3Color,function: () {
                    value.incomplete();
                  },),
                ],
              ),
              SizedBox(height: 15),
              
              Expanded(
                child: value2.isLoading ==true ? Center(child: CircularProgressIndicator()):
                todos.isEmpty ? Center(child: Text(AppConstants.noData)):
                ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo =todos[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: ListTile(
                      shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                      tileColor: AppColor.backgroundColor,
                      title: Text(todos[index].title.toString()),
                      subtitle: Text("User Id : ${todo.userId}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            activeColor: AppColor.backgroundColor,
                            checkColor: AppColor.success,
                            side: BorderSide(color: AppColor.normal),
                            value: todo.completed, onChanged: (val){value2.toggle(index, val);}),
                            PopupMenuButton(
                              onSelected: (choice) {
                                if(choice =='edit'){
                                  updatedDialogbox(context,value2.userIdcontroller,value2.titleContropller, value2.userIdUpdateContropller,value2.titleUpdateContropller,value2.swichvalue, index);
                                
                                }
                                if(choice=='delete'){
                                  value2.deletetodo(value2.tododata[index].id);
                                }
                              } ,
                              color: AppColor.backgroundColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'edit',
                                child: Text(AppConstants.pop1)),
                              PopupMenuItem(
                                value: 'delete',
                                child: Text(AppConstants.pop2)),
                            ],)
                        ],
                      ),
                    ),
                  );
                },),
              ),
            ],
          ),
        );
  }
      ),
      floatingActionButton: Consumer<ApiController>(
        builder: (context, value, child) =>FloatingActionButton(
          onPressed: (){dialogbox(context, value.userIdcontroller, value.titleContropller);},
        backgroundColor: AppColor.primary,
        shape: CircleBorder(),
        child: Icon(Icons.add,color: AppColor.backgroundColor,size: 20,),
        ),
      ),
    );
  }


}