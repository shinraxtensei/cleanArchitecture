  abstract class Cat {
    final String id;
    final String url;
    final int width;
    final int height;

    Cat({
      required this.id,
      required this.url,
      required this.width,
      required this.height,
    });

    //getters
    String get getId => id;
    String get getUrl => url;
    int get getWidth => width;
    int get getHeight => height;
    
  }