import 'package:flutter/material.dart';
import 'package:miniproject/pages/student_login.dart';
import 'package:miniproject/pages/teacher_login.dart';

class SelectOp extends StatelessWidget {
  const SelectOp({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox(height: 40);
    return Scaffold(

      backgroundColor: Colors.white,
    
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
    
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 1,),
                Container(
                    padding: const EdgeInsets.only(top: 2,),
                  
                  child: const Text("ATMOS",
                  style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w400,fontSize: 50.0),),
                ),
                const SizedBox(height: 120,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const StudentLogin()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                          
                    ),
                    
                    child: const Text("STUDENT"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const TeacherLogin()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("TEACHER")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
