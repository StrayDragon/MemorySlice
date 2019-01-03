/*1::简单查询书籍信息*/
SELECT *
FROM book;

/*1::AND查询书籍信息*/
SELECT *
FROM book
WHERE amount = 3
  AND book.author = '陈硕';

/*2::查看书籍总数*/
select id, title, amount
from book;

/*2::查看某个书籍在馆数量和总数*/
-- 总数
SELECT amount
FROM book
WHERE book.title = '第一行代码：Android(第2版)';

-- 借阅数 
select COUNT(*)
from borrowing_info
where book_id = (select book.id from book where title = '第一行代码：Android(第2版)'); -- 某个书籍

-- 剩余数量
select (SELECT amount FROM book WHERE book.title = '第一行代码：Android(第2版)') - (select COUNT(*)
                                                                            from borrowing_info
                                                                            where book_id = (select book.id
                                                                                             from book
                                                                                             where title = '第一行代码：Android(第2版)') -- 某个书籍
                                                                           );

/*3,4::增删书籍*/

/*4::()*/

/*5::修改书籍信息*/

/*6::简单查询借阅者信息*/

/*6::AND查询借阅者信息*/

/*7::查看某人已借阅书籍*/
SELECT borrower.name, book.title, borrowing_info.borrow_time, borrowing_info.return_time
FROM borrower,
     borrowing_info,
     book
WHERE borrower_id = borrower.id
  AND book_id = book.id
  AND borrower.name = 'yichiqingtanshui';

/*7::某人已借阅书籍*/
SELECT borrower.name, COUNT(*) as 'amount_of_borrowing_books'
FROM borrower,
     borrowing_info
WHERE borrower.name = 'yichiqingtanshui'
  AND borrower_id = borrower.id;

/*8,9,10::可增删修读者信息*/

/*11::某个借阅人完成还某书手续*/
UPDATE "borrowing_info"
SET "return_time" = 18888888
WHERE "borrow_time" = ();

/*12::还书超期,显示天数*/
SELECT borrowing_info.book_id, (return_time - deadline) AS 'result'
FROM borrowing_info,
     borrower
WHERE "borrower_id" = (select id FROM borrower WHERE name = 'yichiqingtanshui')
  AND borrower_id = borrower.id
  AND borrow_time = (966); -- 转换超期天数

/*13::逾期未还,修改can_borrow字段*/
UPDATE "borrower"
SET "can_borrow" = 0
WHERE "id" = (SELECT id FROM borrower WHERE name = 'yichiqingtanshui');

/*14::*/
SELECT borrower.name,book.title
FROM borrower,
     borrowing_info,
     book
WHERE state = 0
  AND borrower_id = borrower.id
  AND book_id = book.id;
