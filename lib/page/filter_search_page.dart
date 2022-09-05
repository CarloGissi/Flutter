import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/PcDataModel.dart';
import '../model/PcDetail.dart';

class FilterSearchPage extends StatelessWidget {

  final int prezzo_min, prezzo_max, ru,rs,rt;

  String tipo, sistema,utilizzo;

  FilterSearchPage( this.prezzo_min, this.prezzo_max,
     this.ru, this.rs, this.rt,this.sistema,this.tipo,this.utilizzo);

   late Stream<QuerySnapshot> pcStream;

  void filtroSO(){
    if(rs == 6){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').snapshots();
    }
    else if(rs==7){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').snapshots();
    }
    else if(rs==8){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').snapshots();
    }
  }

  void filtroTipologia(){
    if(rt == 4){
      pcStream = FirebaseFirestore.instance.collection('pc').where('tipo', isEqualTo: 'desktop').snapshots();
    }
    else if(rt==5){
      pcStream = FirebaseFirestore.instance.collection('pc').where('tipo', isEqualTo: 'notebook').snapshots();
    }
  }

  void filtroPrezzo(){
    pcStream = FirebaseFirestore.instance.collection('pc').where('prezzo', isGreaterThan: prezzo_min).where('prezzo', isLessThanOrEqualTo: prezzo_max).snapshots();
  }

  void filtroPrezzo_Tipo(){
    if(rt == 4){
      pcStream = FirebaseFirestore.instance.collection('pc').where('tipo', isEqualTo: 'desktop').where('prezzo', isGreaterThan: prezzo_min).where('prezzo', isLessThanOrEqualTo: prezzo_max).snapshots();
    }
    else if(rt==5){
      pcStream = FirebaseFirestore.instance.collection('pc').where('tipo', isEqualTo: 'notebook').where('prezzo', isGreaterThan: prezzo_min).where('prezzo', isLessThanOrEqualTo: prezzo_max).snapshots();
    }
  }

  void filtroSO_Tipo(){
    if(rs == 6 && rt == 4){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').where('tipo', isEqualTo: 'desktop').snapshots();
    }
    else if(rs==7 && rt == 4){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').where('tipo', isEqualTo: 'desktop').snapshots();
    }
    else if(rs==8 && rt == 4){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').where('tipo', isEqualTo: 'desktop').snapshots();
    }
    if(rs == 6 && rt == 5){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').where('tipo', isEqualTo: 'notebook').snapshots();
    }
    else if(rs==7 && rt == 5){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').where('tipo', isEqualTo: 'notebook').snapshots();
    }
    else if(rs==8 && rt == 5){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').where('tipo', isEqualTo: 'notebook').snapshots();
    }
  }

  void filtroUtilizzo(){
    if(ru == 1){ //casa
      pcStream = FirebaseFirestore.instance.collection('pc').where('ram', isLessThanOrEqualTo: 4).snapshots();
    }
    else if(ru==2){ //game
      pcStream = FirebaseFirestore.instance.collection('pc').where('ram', isGreaterThan: 16).snapshots();

    } else if(ru==3){ //lavoro
      pcStream = FirebaseFirestore.instance.collection('pc').where('ram', isLessThanOrEqualTo: 8).snapshots();
    }
  }

  void filtroUtilizzoTipoSO(){
    if(rs == 6 && rt == 4 && ru ==1){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo:  4).snapshots();
    }
    else if(rs==7 && rt == 4 && ru==1){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo: 4).snapshots();
    }
    else if(rs==8 && rt == 4 && ru==1){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo: 4).snapshots();
    }
    if(rs == 6 && rt == 5 && ru==1){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 4).snapshots();
    }
    else if(rs==7 && rt == 5 && ru==1){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 4).snapshots();
    }
    else if(rs==8 && rt == 5 && ru==1){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 4).snapshots();
    }

    if(rs == 6 && rt == 4 && ru ==2){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo:  16).snapshots();
    }
    else if(rs==7 && rt == 4 && ru==2){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo: 16).snapshots();
    }
    else if(rs==8 && rt == 4 && ru==2){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo: 16).snapshots();
    }
    if(rs == 6 && rt == 5 && ru==2){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 16).snapshots();
    }
    else if(rs==7 && rt == 5 && ru==2){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 16).snapshots();
    }
    else if(rs==8 && rt == 5 && ru==2){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 16).snapshots();
    }

    if(rs == 6 && rt == 4 && ru ==3){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo:  8).snapshots();
    }
    else if(rs==7 && rt == 4 && ru==3){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo: 8).snapshots();
    }
    else if(rs==8 && rt == 4 && ru==3){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').where('tipo', isEqualTo: 'desktop').where('ram', isEqualTo: 8).snapshots();
    }
    if(rs == 6 && rt == 5 && ru==3){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Windows').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 8).snapshots();
    }
    else if(rs==7 && rt == 5 && ru==3){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'MacOS').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 8).snapshots();
    }
    else if(rs==8 && rt == 5 && ru==3){
      pcStream = FirebaseFirestore.instance.collection('pc').where('sistemaOperativo', isEqualTo: 'Linux').where('tipo', isEqualTo: 'notebook').where('ram', isEqualTo: 8).snapshots();
    }
  }

@override
Widget build(BuildContext context) {

  if(tipo == 'null' && sistema == 'null' && utilizzo == 'null'){
    filtroPrezzo();
  }
  else if(tipo == 'null' && sistema == 'null' && utilizzo != 'null'){
    filtroUtilizzo();
  }
  else if(tipo != 'null' && sistema == 'null' && utilizzo == 'null'){
    filtroTipologia();
  }

  else if(tipo == 'null' && sistema != 'null' && utilizzo != 'null'){// caso non implementato
    filtroSO();
  }
  else if(tipo != 'null' && sistema == 'null' && utilizzo != 'null'){ // caso non implementato
    filtroTipologia();
  }
  else if(tipo == 'null' && sistema != 'null' && utilizzo == 'null') {
    filtroSO();
  }
  else if(tipo != 'null' && sistema != 'null' && utilizzo == 'null') {
    filtroSO_Tipo();
  }
  else if(tipo != 'null' && sistema != 'null' && utilizzo != 'null') {
    filtroUtilizzoTipoSO();
  }


    return Scaffold(
    appBar: AppBar(
      title: Text(
        'FilterSearchPage',
        style: TextStyle(
          color: Colors.cyanAccent,
        ),
      ),
      backgroundColor: Colors.blueAccent,
    ),
    body: StreamBuilder<QuerySnapshot> (
      stream: pcStream,
      builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
        if(snapshot.hasError) {
          return Text('error');
        }
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }
        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context,index ) {

            //creo l'array di pc popolandolo
            List<PcDataModel> Pcdata = List.generate(data.size,
                    (index)
                => PcDataModel(data.docs[index].id,data.docs[index]['nome'], data.docs[index]['img'], data.docs[index]['descrizione'],
                    data.docs[index]['colore'], data.docs[index]['marca'], data.docs[index]['processore'],
                    data.docs[index]['schedaGrafica'], data.docs[index]['sistemaOperativo'],data.docs[index]['tipoMemSec'] ,
                    data.docs[index]['tipo'] ,data.docs[index]['preferito'] ,data.docs[index]['numeroProcessore'] ,
                    data.docs[index]['dimMemSec'] ,data.docs[index]['ram'] , 15.0,
                    data.docs[index]['peso'], data.docs[index]['prezzo']));



            return
              Card(
                child: ListTile(
                  title: Text(data.docs[index]['nome']),
                  subtitle: Text('€ ${data.docs[index]['prezzo']}'),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      data.docs[index]['img'],
                      //mostra caricamento
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PcDetail(pcDataModel: Pcdata[index],)));
                  },
                ),
              );
          },
        );
      },
    ),
  );
}
}