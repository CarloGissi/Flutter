import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydevice_flutter/model/PcDataModel.dart';

class PcDetail extends StatelessWidget {
  final PcDataModel pcDataModel;

    const PcDetail({Key? key, required this.pcDataModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pcDataModel.nome),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
        children: [
          
          Image.network(
            pcDataModel.img,
            height: 300,
          ),
          Text(pcDataModel.descrizione,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('RAM: ${pcDataModel.ram}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('COLORE: ${pcDataModel.colore}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('MARCA: ${pcDataModel.marca}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('PROCESSORE: ${pcDataModel.processore}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('NUMERO DI PROCESSORI: ${pcDataModel.numeroProcessore}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('PREZZO: € ${pcDataModel.prezzo}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('TIPO MEMORIA SECONDARIA: ${pcDataModel.tipoMemSec}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('TIPOLOGIA: ${pcDataModel.tipo}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('DIMENSIONI MEMORIA: ${pcDataModel.dimMemSec}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('SCHEDA GRAFICA: ${pcDataModel.schedaGrafica}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('DIMENSIONI SCHERMO: ${pcDataModel.dimensioneSchermo}'),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('PESO: ${pcDataModel.peso}'),
          ),
          SizedBox(height: 5,),
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        backgroundColor: Colors.red,
        onPressed: () { setPreferito(pcDataModel.id); },
      ),
    );
  }

  //funzione che mette e toglie il pc dalla lista preferiti
  void setPreferito(String id){
      if(pcDataModel.preferito == true){
        FirebaseFirestore.instance.collection('pc').doc(id).update({'preferito': false})
            .then((value) => print("Pc aggiunto ai preferiti"))
            .catchError((error) => print("Failed to update pc: $error"));

      }
      else {
        FirebaseFirestore.instance.collection('pc').doc(id).update({'preferito': true})
            .then((value) => print("Pc rimosso dai preferiti"))
            .catchError((error) => print("Failed to update pc: $error"));
      }
  }
}