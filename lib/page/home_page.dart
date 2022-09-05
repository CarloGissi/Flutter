import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/PcDataModel.dart';
import '../model/PcDetail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>
{int currentIndex = 0;

Stream<QuerySnapshot> pc = FirebaseFirestore.instance.collection('pc').snapshots();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'HomePage',
        style: TextStyle(
          color: Colors.cyanAccent,
        ),
      ),
      backgroundColor: Colors.blueAccent,
    ),
    body: StreamBuilder<QuerySnapshot> (
      stream: pc,
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
                    data.docs[index]['dimMemSec'] ,data.docs[index]['ram'] , 15.1,
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