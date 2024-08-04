import 'package:flutter/material.dart';
import '../../model/article.dart';

class CArticle extends StatelessWidget {

  final Article article;
  const CArticle({super.key,  required this.article, });
  

  @override
  Widget build(BuildContext context){

    return GestureDetector(

      onTap: () {},
      //     Navigator.push(
      //   context, 
      //   MaterialPageRoute(
      //     builder: (context) => WebViewContainer(articleURL: article.articleURL ?? 'https://www.google.com',),
      //   )
      // ),

      child: Container(
    
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only( topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                article.image ??  'https://media.istockphoto.com/vectors/loading-icon-isolated-on-blue-background-progress-bar-icon-flat-vector-id1092703422?k=20&m=1092703422&s=612x612&w=0&h=UWtVpC7z8wPMpoT9CQuEt2Ykz1mjbyHxduSpWJudksI=', 
                width:( MediaQuery.sizeOf(context).width - 20),
                height: 200, 
                fit: BoxFit.cover, 
              )
            ),           
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    article.title ?? '',
                    style: const TextStyle(
                      fontSize: 20, 
                      color: Colors.white, 
                      fontWeight: FontWeight.w600
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, 
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    article.description ?? '',
                    style:const  TextStyle(
                      fontSize: 16, 
                      color: Colors.white, 
                      fontWeight: FontWeight.normal
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, 
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.author ?? '',
                        style: const TextStyle(
                          fontSize: 14, 
                          color: Colors.white, 
                          fontWeight: FontWeight.w500
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        article.time ?? '',
                        style: const TextStyle(
                          fontSize: 14, 
                          color: Colors.white, 
                          fontWeight: FontWeight.normal
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),                           
          ],
        ),
      ),
    );
  }
}