class Articles {

  Articles({ this.articles});

  final List<dynamic>? articles;


  factory Articles.fromJson( Map<String, dynamic> jsonData ) {

    return Articles(
    
      articles: jsonData['articles'],
    
    );

  }

}