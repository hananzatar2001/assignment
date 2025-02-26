import 'dart:io';
List<Map<String, dynamic>> library = [];

//Add books to the library.
void addBook({
  required String title,
  String author = 'Unknown',
  int year = 0,
  String genre = 'General',
}) {
  library.add({
    'title': title,
    'author': author,
    'year': year,
    'genre': genre,
  });
  print('Book added successfully.');
}
//Retrieve information about a book by its title.
String getBookInfo({required String title}) {
  for (var book in library) {
    if (book['title'] == title) {
      return 'Author: ${book['author']}, Year: ${book['year']}, Genre: ${book['genre']}';
    }
  }
  return 'Book not found.';
}
//List all books in the library.
void listAllBooks({String? genre}) {
  if (genre != null) {
    var filteredBooks = library.where((book) => book['genre'] == genre).toList();
    for (var book in filteredBooks) {
      print(book);
    }
  } else {
    for (var book in library) {
      print(book);
    }
  }
}
//List books by genre
dynamic listBooksByGenre({required String genre}) {
  var books = library.where((book) => book['genre'] == genre).toList();
  if (books.isNotEmpty) {
    return books;
  } else {
    return 'No books found for this genre.';
  }
}

//5. Remove books from the library.
String removeBook({required String title}) {
  var bookToRemove = library.where((book) => book['title'] == title).toList();
  if (bookToRemove.isNotEmpty) {
    library.remove(bookToRemove.first);
    return 'Book removed successfully.';
  } else {
    return 'Book not found.';
  }
}
void main() {

  bool run =true;
  while(run)
  {
    print('\n--- Library Management System ---');
    print('1. Add a book');
    print('2. Get book information');
    print('3. List all books');
    print('4. List books by genre');
    print('5. Remove a book');
    print('6. Exit');

    stdout.write('Enter your choice (1-6): ');
    var choice = stdin.readLineSync();

    switch(choice){
      // Add a book
      case '1': 
        stdout.write('Enter book title: ');
        var title = stdin.readLineSync();
        stdout.write('Enter book author: ');
        var author = stdin.readLineSync();
        stdout.write('Enter book year: ');
        var year = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        stdout.write('Enter book genre: ');
        var genre = stdin.readLineSync();
        addBook(
          title: title ?? 'Unknown',
          author: author ?? 'Unknown',
          year: year,
          genre: genre ?? 'General',
        );
        break;

      // Get book information
      case '2': 
        stdout.write('Enter book title: ');
        var title = stdin.readLineSync();
        print(getBookInfo(title: title ?? ''));
        break;

      // List all books
      case '3': 
        print('All books:');
        listAllBooks();
        break;

      // List books by genre
      case '4': 
        stdout.write('Enter genre: ');
        var genre = stdin.readLineSync();
        var books = listBooksByGenre(genre: genre ?? '');
        if (books is List) {
          for (var book in books) {
            print(book);
          }
        } else {
          print(books);
        }
        break;

      // Remove a book
      case '5': 
        stdout.write('Enter book title: ');
        var title = stdin.readLineSync();
        print(removeBook(title: title ?? ''));
        break;

      // Exit
      case '6': 
        run = false;
        print('Exiting the program. Goodbye!');
        break;

      default:
        print('Invalid choice. Please enter a number between 1 and 6.');
    }

  }

}
/*
 (title: 'Dart Programming', author: 'John Doe', year: 2022, genre: 'Programming');
 (title: 'Flutter Basics', author: 'Jane Smith', year: 2021, genre: 'Programming');
 (title: 'The Great Novel', author: 'Author Unknown', year: 1999, genre: 'Fiction');

 */