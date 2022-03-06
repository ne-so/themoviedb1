import 'package:flutter/material.dart';
import 'package:themoviedb_1/resources/resources.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 163,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                       offset: const Offset(0, 2), 
                    )
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    const Image(image: AssetImage(AppImages.moviePlaceHolder)),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10,),
                          Text(
                            'Острые козырьки',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'March 6, 2022',
                            style: TextStyle(color: Colors.grey),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 15,),
                          Text(
                            'О криминальном мире Бирмингема 20-х годов прошлого века, в котором многолюдная семья Шелби стала одной из самых жестоких и влиятельных гангстерских банд послевоенного времени. Фирменным знаком группировки, промышлявшей грабежами и азартными играми, стали зашитые в козырьки лезвия.', 
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    print('11');
                  }
                ),
              )
            ],
          ),
        );
      }
    );    
  }
}