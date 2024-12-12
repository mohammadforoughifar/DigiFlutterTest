import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:untitled2/Entites/slidd.dart';



class Slid extends StatefulWidget {


  @override
  State<Slid> createState() => _SlidState();
}

class _SlidState extends State<Slid> {
  @override
  Widget build(BuildContext context) {

    List<slidd>Sliders=[];
    List<Widget>s=[];
String ll="";


    Future<void> GetAllSlider() async
    {
      var url="http://localhost:3000/Slider";
      await http.get(Uri.parse(url)).then((respose)

      {
           if(respose.statusCode==200)
             {


               List GetAllSlider=convert.jsonDecode(respose.body);

               for(int i=0;i<GetAllSlider.length;i++)
                 {
                   Sliders.add(new slidd(
                       title: GetAllSlider[i]['title'],
                       img_url: GetAllSlider[i]['img_url']
                   ) );
                   ll=GetAllSlider[i]['img_url'];
                   s.add(

                       Image(image: NetworkImage(ll)),


                   );

                 }
               print("Slider COunt====${Sliders.length}");

             }
      });
    }


GetAllSlider();


    return Sliders.length>0 ?
    Container(

      height: 260,
      child: PageView.builder(itemBuilder: (context,position){
        return Image(image: NetworkImage(Sliders[position].img_url));
      },
        //scrollDirection: Axis.horizontal,
        //scrollDirection: Axis.horizontal,
        itemCount: s.length,


      ),
    )
    :
    Container(
    child: CircularProgressIndicator(),
    );
  }
}
