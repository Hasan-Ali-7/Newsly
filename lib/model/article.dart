class Article {

  final String? articleURL;
  final String? image;
  final String? title;
  final String? description;
  final String? author;
  final String? time;


  Article({
    this.articleURL,
    this.image,
    this.title,
    this.description,
    this.author,
    this.time,
  });


  factory Article.fromJson( Map<String, dynamic> jsonData ) {
    return Article(
      articleURL: jsonData['url'],
      image: jsonData['urlToImage'],
      title: jsonData['title'],
      description: jsonData['description'],
      author: jsonData['auther'],
      time: jsonData['publishedAt'],
    );
  }
}