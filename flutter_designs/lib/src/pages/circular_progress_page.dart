
import 'package:flutter/material.dart';
import 'package:flutter_designs/src/wigets/radial_progress_widget.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({ Key? key }) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.refresh ),
        onPressed: (){
          setState(() {
            porcentaje += 20;
            if ( porcentaje > 100 ) {
              porcentaje = 0;
            }
          });
        }
       ),
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue ),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.green ),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blueGrey )
            ],
          )

        ],
      )
    );    
  }
}
class CustomRadialProgress extends StatelessWidget {

  final Color color;

  const CustomRadialProgress({
    required this.porcentaje,
    required this.color
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress( 
        porcentaje: porcentaje,
        colorPrimario: this.color,
        colorSecundario: Colors.grey,
        grosorPrimario: 10,
        grosorSecundario: 4,
      ),
      // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0) ),
    );
  }
}
