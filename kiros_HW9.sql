/* Abel Mengesha HW9 */

/* QUESTION 1 */
mysql> select  concat(City,', ',Statecode) Location , count(PublisherID) Count
    -> from Publisher 
    -> group by concat(City,', ',Statecode)
    -> order by count(PublisherID) asc,concat(City,', ',Statecode) desc;
--------------
select  concat(City,', ',Statecode) Location , count(PublisherID) Count
from Publisher 
group by concat(City,', ',Statecode)
order by count(PublisherID) asc,concat(City,', ',Statecode) desc
--------------

+-------------------+-------+
| Location          | Count |
+-------------------+-------+
| San Francisco, CA |     1 |
| Rochester, MN     |     1 |
| Hartford, CT      |     1 |
| Boston, MA        |     1 |
| Rochester, NY     |     2 |
| Chicago, IL       |     3 |
| New York, NY      |     4 |
+-------------------+-------+
7 rows in set (0.00 sec)


/*QUESTION 2*/
--------------------------------------------------------------
mysql> select Title,count(BookReview.ISBN) 'Total Ratings',min(rating) Low,max(rating) High,round(Avg(rating)) Average
    -> from Book left outer join BookReview on Book.ISBN=BookReview.ISBN
    -> group by Title
    -> order by count(BookReview.ISBN) desc,avg(rating) desc;
--------------
select Title,count(BookReview.ISBN) 'Total Ratings',min(rating) Low,max(rating) High,round(Avg(rating)) Average
from Book left outer join BookReview on Book.ISBN=BookReview.ISBN
group by Title
order by count(BookReview.ISBN) desc,avg(rating) desc
--------------

+--------------------------------------------------+---------------+------+------+---------+
| Title                                            | Total Ratings | Low  | High | Average |
+--------------------------------------------------+---------------+------+------+---------+
| Yes! Networking is for Bills Fans                |             3 |    5 |    8 |       6 |
| The Shortest Book in the World                   |             2 |   10 |   10 |      10 |
| My Love's Last Lingering Lost                    |             2 |    8 |    9 |       9 |
| From Brockport to IT                             |             2 |    7 |   10 |       9 |
| How to Keep your Cellular Bill Down              |             2 |    7 |    8 |       8 |
| Women are From Venus ORACLE is from Beyond Pluto |             1 |   10 |   10 |      10 |
| My Love's Last Longing                           |             1 |   10 |   10 |      10 |
| My Lost Love's Long Last Lingering               |             1 |    9 |    9 |       9 |
| JAVA: It's more than Just a Programming Language |             1 |    9 |    9 |       9 |
| How to add Class to your Programming             |             1 |    9 |    9 |       9 |
| My Love's at Long Last Lost his Lingering        |             1 |    7 |    7 |       7 |
| How to Keep your Cable Bill Down                 |             1 |    7 |    7 |       7 |
| I Lasted my Love's Last Lingering Longing        |             1 |    7 |    7 |       7 |
| From Deep in the Heart of Texas to IT            |             1 |    6 |    6 |       6 |
| ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR  |             1 |    4 |    4 |       4 |
| From the Shores of Lake Erie to IT               |             1 |    4 |    4 |       4 |
| Master HTML Through The Classic Comics           |             0 | NULL | NULL |    NULL |
| Master C++ Through The Classic Comics            |             0 | NULL | NULL |    NULL |
| Tired of wired? Infrared instead!                |             0 | NULL | NULL |    NULL |
| Calculus for Phys Ed Majors                      |             0 | NULL | NULL |    NULL |
| Master Wireless Through The Classic Comics       |             0 | NULL | NULL |    NULL |
| The Science of Literature Searching              |             0 | NULL | NULL |    NULL |
| A language without Pointers? Priceless.          |             0 | NULL | NULL |    NULL |
+--------------------------------------------------+---------------+------+------+---------+
23 rows in set (0.00 sec)

/*QUESTION 3*/
--------------------------------------------------
mysql> select Publisher.Name 'Publisher Name', count(ISBN) 'Book Count'
    -> from Publisher join Book on Publisher.PublisherID= Book.PublisherID
    -> group by Publisher.Name 
    -> having count(ISBN) > 2
    -> order by count(ISBN) desc, Publisher.Name asc;
--------------
select Publisher.Name 'Publisher Name', count(ISBN) 'Book Count'
from Publisher join Book on Publisher.PublisherID= Book.PublisherID
group by Publisher.Name 
having count(ISBN) > 2
order by count(ISBN) desc, Publisher.Name asc
--------------

+----------------------------------+------------+
| Publisher Name                   | Book Count |
+----------------------------------+------------+
| ReadEmandWeep Romance Publishing |          5 |
| CovertoCover Publishing          |          4 |
| EZRead Masterpiece Comics        |          3 |
+----------------------------------+------------+
3 rows in set (0.01 sec)

/*QUESTION 4*/
-----------------------------------------------------------------------------------------------
mysql> select Title, length(Title) Length,substr(Title,Instr(Title,"bill")+4) "After Bill"
    -> from Book
    -> where Title like '%bill%';
--------------
select Title, length(Title) Length,substr(Title,Instr(Title,"bill")+4) "After Bill"
from Book
where Title like '%bill%'
--------------

+-------------------------------------+--------+------------+
| Title                               | Length | After Bill |
+-------------------------------------+--------+------------+
| Yes! Networking is for Bills Fans   |     33 | s Fans     |
| How to Keep your Cellular Bill Down |     35 |  Down      |
| How to Keep your Cable Bill Down    |     32 |  Down      |
+-------------------------------------+--------+------------+
3 rows in set (0.01 sec)

/*QUESTION 5*/
mysql> select distinct Title 
    -> from Book join OwnersBook on Ownersbook.ISBN = Book.ISBN;
--------------
select distinct Title 
from Book join OwnersBook on Ownersbook.ISBN = Book.ISBN
--------------

+-------------------------------------------------+
| Title                                           |
+-------------------------------------------------+
| The Shortest Book in the World                  |
| From the Shores of Lake Erie to IT              |
| My Love's at Long Last Lost his Lingering       |
| My Love's Last Lingering Lost                   |
| How to Keep your Cellular Bill Down             |
| Yes! Networking is for Bills Fans               |
| My Love's Last Longing                          |
| From Deep in the Heart of Texas to IT           |
| How to Keep your Cable Bill Down                |
| I Lasted my Love's Last Lingering Longing       |
| My Lost Love's Long Last Lingering              |
| ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR |
| The Science of Literature Searching             |
+-------------------------------------------------+
13 rows in set (0.01 sec)