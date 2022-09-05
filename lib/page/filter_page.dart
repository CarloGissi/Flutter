
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydevice_flutter/page/filter_search_page.dart';

class FilterPage extends StatefulWidget {

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage>
{
  RangeValues values = RangeValues(0, 2000);
  RangeLabels labels = RangeLabels('0', '2000');
  int valueRadioUtilizzo = 0;
  int _valueRadioTipologia = 0;
  int _valueRadioSO = 0;
  String tipo = 'null', sistema = 'null', utilizzo ='null';


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Filtri'),
      ),
      body:
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prezzo', style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).accentColor,
                ),
                ),
                RangeSlider(
                    min: 0,
                    max: 2000,
                    divisions: 40, //divido in 40 per far scegliere ogni 50€
                    values: values,
                    labels: labels,
                    onChanged: (value) {
                      setState(() {
                        values = value;
                        labels = RangeLabels('${value.start.toInt().toString()}\€', '${value.end.toInt().toString()}\€');
                      });
                    }),
                Text(
                  'Utilizzo', style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).accentColor,
                ),
                ),
                    RadioListTile(
                      title: Text('Casa'),
                      value: 1,
                      groupValue: valueRadioUtilizzo,
                      onChanged: (value){
                        setState(() {
                          utilizzo='casa';
                          valueRadioUtilizzo = value as int;

                        });
                        },
                    ),
                RadioListTile(
                  title: Text('Game'),
                  value: 2,
                  groupValue: valueRadioUtilizzo,
                  onChanged: (value){
                    setState(() {
                      utilizzo='game';

                      valueRadioUtilizzo = value as int;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Lavoro'),
                  value: 3,
                  groupValue: valueRadioUtilizzo,
                  onChanged: (value){
                    setState(() {
                      utilizzo='lav';

                      valueRadioUtilizzo = value as int;

                    });
                  },
                ),
                Text(
                  'Tipologia', style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).accentColor,
                ),
                ),
                RadioListTile(
                  title: Text('Desktop'),
                  value: 4,
                  groupValue: _valueRadioTipologia,
                  onChanged: (value){
                    setState(() {
                      tipo='dk';
                      _valueRadioTipologia = value as int;

                    });
                  },
                ),
                RadioListTile(
                  title: Text('Portatile'),
                  value: 5,
                  groupValue: _valueRadioTipologia,
                  onChanged: (value){
                    setState(() {
                      tipo='nb';
                      _valueRadioTipologia = value as int;
                    });
                  },
                ),
                Text(
                  'Sistema operativo', style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).accentColor,
                ),
                ),
                RadioListTile(
                  title: Text('Windows'),
                  value: 6,
                  groupValue: _valueRadioSO,
                  onChanged: (value){
                    setState(() {
                      sistema='w';
                      _valueRadioSO = value as int;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('MacOS'),
                  value: 7,
                  groupValue: _valueRadioSO,
                  onChanged: (value){
                    setState(() {
                      sistema='m';
                      _valueRadioSO = value as int;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Linux'),
                  value: 8,
                  groupValue: _valueRadioSO,
                  onChanged: (value){
                    setState(() {
                      sistema='l';
                      _valueRadioSO = value as int;
                    });
                  },
                ),

                Row(
                  children: [
                    SizedBox(
                        width: 50.0
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          child: Text('CERCA'),
                          onPressed: ()  {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FilterSearchPage(values.start.toInt(),values.end.toInt(),valueRadioUtilizzo,_valueRadioSO,_valueRadioTipologia,sistema,tipo,utilizzo)));
                          },
                        )
                    ),
                    SizedBox(
                      width: 100.0
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          child: Text('CANCELLA'),
                          onPressed: ()  {
                            setState(() {
                              valueRadioUtilizzo = 0;
                              _valueRadioTipologia = 0;
                              _valueRadioSO = 0;
                              tipo = 'null';
                              sistema = 'null';
                               utilizzo = 'null';
                            });
                          },
                        )
                    ),
                  ],
                ),


              ],
            ),
          )
  );
}