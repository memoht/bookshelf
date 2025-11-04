# Bookshelf app

![alt: logo for bookshelf app](https://github.com/memoht/bookshelf/blob/main/app/assets/images/logo-bookshelf.svg)

Bookshelf app built by following [Hanami 2.x tutorial](https://guides.hanamirb.org/v2.0/tutorials/bookshelf/)

## My setup

+ [Ruby version: 3.4.x](https://www.ruby-lang.org/en/)
+ [Ruby-install](https://github.com/postmodern/ruby-install)
+ [Postgres app](https://postgresapp.com/)
+ [GitHub Desktop](https://desktop.github.com/)
+ [Visual Code](https://code.visualstudio.com)

## Notes

+ Database migrations: <https://guides.hanamirb.org/v2.2/database/migrations/>
+ ISBN 10 and 13 format: https://bookscouter.com/blog/isbn-10-vs-isbn-13-the-difference/
+ Open Library Covers API: https://openlibrary.org/dev/docs/api/covers. Note: rate limiting is applied to this API, so the sample app only includes 3 book seeds.

### Attributions

This project is based on the [Hanami 2.x tutorial](https://guides.hanamirb.org/v2.0/tutorials/bookshelf/). All credits go to the Hanami team for creating the tutorial and the framework.

+ **Bookshelf image from Library icons created by Good Ware - Flaticon:** <https://www.flaticon.com/free-icons/library>

+ **Google Fonts - Lexend:** <https://fonts.google.com/specimen/Lexend?preview.text=Bookshelf>

+ **Using UUIDs columns with Hanami:** <https://medium.com/@rodrigopk/using-uuid-columns-with-hanami-7208f824bb77>

### Project Gems

+ **Barkick | Barcodes made easy:** https://github.com/ankane/barkick
+ **RQRCode | A simple and efficient QR code generator for Ruby:** https://github.com/whomwah/rqrcode
+ **Barby | A generic interface for barcodes in Ruby:** https://github.com/toretore/barby

### ToDo

+ [ ] Cache response from Open Library Covers API
+ [ ] Add search functionality
