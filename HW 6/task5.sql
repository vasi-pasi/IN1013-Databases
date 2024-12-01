--1
SELECT
    restStaff.first_name, restStaff.surname, restBill.bill_date,
    COUNT(restBill.bill_no) AS bill_no  
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.staff_no, restBill.bill_date 
    COUNT(restBill.bill_) >= 2;  




--2
SELECT room_name, COUNT(*) AS table_count
FROM restrest_table
WHERE no_of_seats > 6
GROUP BY room_name;

--3



SELECT m.room_name, SUM(r.bill_total) AS total_bill_total
FROM restrest_table m
INNER JOIN restbill r ON r.table_no = m.table_no
GROUP BY m.room_name;

--4



SELECT y.first_name, y.surname, SUM(r.bill_total) AS total_bill_total
FROM reststaff rs
INNER JOIN restbill r ON r.waiter_no = rs.staff_no
INNER JOIN reststaff y ON rs.headwaiter = y.staff_no
GROUP BY y.first_name, y.surname
ORDER BY total_bill_total DESC;

--5



SELECT cust_name, AVG(bill_total)
FROM restbill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

--6


SELECT s.first_name, s.surname, COUNT(b.bill_no) AS billcount
FROM restbill b
JOIN reststaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname
HAVING billcount > 3;