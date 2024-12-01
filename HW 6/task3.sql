--1
SELECT first_name, surname FROM restStaff INNER JOIN restBill ON restStaff.staff_no= restBill.waiter_no WHERE cust_name= "Tanya Singh";



--2
SELECT room_date FROM restRoom_management INNER JOIN restStaff ON staff_no= 10 WHERE room_date LIKE "%1602%" AND room_name= "Green" ;




--3
SELECT t2.first_name, t2.surname FROM reststaff t1 INNER JOIN reststaff t2 ON t1.headwaiter = t2.headwaiter WHERE t1.staff_no = 3 AND t2.staff_no != t1.staff_no;



--4
SELECT cust_name, bill_total, first_name, surname FROM restBill INNER JOIN  restStaff ON staff_no= waiter_no
ORDER BY bill_total DESC;



--5
SELECT DISTINCT T2.first_name, T2.surname
FROM restBill E1
INNER JOIN restStaff T1 ON E1.waiter_no = T1.staff_no
INNER JOIN restStaff T2 ON T1.headwaiter = T2.headwaiter
WHERE E1.bill_no IN (14, 17)
AND T2.staff_no != T1.staff_no;



--6
SELECT t1.first_name, t1.surname
FROM restStaff t1
INNER JOIN restRoom_management t2 ON t2.headwaiter= t1.staff_no OR t1.headwaiter= t2.headwaiter
WHERE t2.room_name= "Blue" AND t2.room_date= "160312";