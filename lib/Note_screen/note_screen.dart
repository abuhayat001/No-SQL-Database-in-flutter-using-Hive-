import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_15/NoteController/note_controller.dart';
import 'package:lesson_15/Note_mod/note_mod.dart';
class NoteScreen extends StatelessWidget {
  NoteScreen({Key? key}) : super(key: key);
  TextEditingController idClt = TextEditingController();
  TextEditingController nameClt = TextEditingController();
  TextEditingController departClt = TextEditingController();
  NoteControler noteCo = Get.put(NoteControler());

  final Box box = Hive.box("notes");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("FLUTTER" , style: TextStyle(color: Colors.blue),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          _hello(context);
        },
        child: Icon(Icons.add, size: 44.0, color: Colors.lightBlue,),
      ),


      body: GetBuilder<NoteControler>(builder:(_){
        return ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context,box,child) {
            return ListView.builder(
                itemCount: box.keys.length,
                itemBuilder:(context,index){

                  NoteMo note = box.getAt(index);


                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Text(note.ID,),
                      title: Text(note.Name,),
                      subtitle: Text(note.DepartMent,),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                _hello_1(context, index);
                              },
                              child: Icon(Icons.edit, color: Colors.green,),
                            ),
                            InkWell(
                              onTap: (){
                                noteCo.delet_note(index);
                              },
                              child: Icon(Icons.delete,color: Colors.red,),
                            )
                          ],
                        ),
                      ),


                    ),
                  );
                });
          }
        );
      },),



    );
  }
  _hello(BuildContext context){
    return showDialog(context: context, builder:(_){
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            content: Column(
              children: [
                Container(
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(41.0),
                        bottomLeft: Radius.circular(41.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: TextField(
                      controller: idClt,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ID No'
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 14.0,),
                Container(
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(41.0),
                        bottomLeft: Radius.circular(41.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: TextField(
                      controller: nameClt,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Student Name'
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 14.0,),
                Container(
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(41.0),
                        bottomLeft: Radius.circular(41.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: TextField(
                      controller: departClt,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Department'
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 14.0,),
              ],
            ) ,
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text("Cancle", style: TextStyle(color: Colors.black),) ,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              ElevatedButton(onPressed: (){
                noteCo.creatNot(NoteMo(idClt.text, nameClt.text, departClt.text));
                Navigator.pop(context);
              },
                child: Text("Submit", style: TextStyle(color: Colors.white),) ,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          ),
        ),
      );
    });
  }

  _hello_1(BuildContext context, int index){
    return showDialog(context: context, builder:(_){
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            content: Column(
              children: [
                Container(
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(41.0),
                        bottomLeft: Radius.circular(41.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: TextField(
                      controller: idClt,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ID No'
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 14.0,),
                Container(
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(41.0),
                        bottomLeft: Radius.circular(41.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: TextField(
                      controller: nameClt,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Student Name'
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 14.0,),
                Container(
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(41.0),
                        bottomLeft: Radius.circular(41.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: TextField(
                      controller: departClt,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Department'
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 14.0,),
              ],
            ) ,
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text("Cancle", style: TextStyle(color: Colors.black),) ,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              ElevatedButton(onPressed: (){
                noteCo.update_note(NoteMo(idClt.text, nameClt.text, departClt.text), index);
                Navigator.pop(context);
              },
                child: Text("Update", style: TextStyle(color: Colors.white),) ,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          ),
        ),
      );
    });
  }
}
