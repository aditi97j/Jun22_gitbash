create database adititest;
use adititest;

-- Q1:
SELECT customer.cust_name AS "Customer",
customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer
WHERE orders.customer_id = customer.custemor_id
AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;

-- Q2: 
select * from orders;
select max(commision) from salesman;

select * from orders where salesman_id in
(select salesman_id from salesman where commision in
(select max(commision) from salesman));



-- Q3:
select a.ord_no, a.purch_amt, a.ord_date, b.salesman_id
from orders a inner join salesman b
on a.salesman_id = b.salesman_id
where b.city = 'nagpur';

-- Q4:
select ord_date, sum(purch_amt), sum(purch_amt)*0.15 as total_commission
from orders
group by ord_date
order by ord_date  ;
 
-- Q5:
select ord_no, purch_amt,ord_date, salesman_id  from Orders
where purch_amt > all (select avg(purch_amt) from orders);

-- Q6:
select round(purch_amt) as purch_amount from orders order by purch_amount desc limit 4,1;

-- Q7:
-- Entities in sql are objects that are contained in masters data services models. 
-- Relationships in sql are the established associations between two or more tables. 
-- Entities are connect to each other using relationships. Therefore, entity is a real-world object
-- while relationship is an association between the entities. 

-- Q8:
select xx.customer_id, xx.account_number,
case 
when Balance_amount =0 and account_type = "Credit Card" then Balance_amount + Transaction_amount
else Balance_amount
end as balance_amount
from(select a.customer_id,a.account_number, a.balance_amount,
a.account_type,b.Transaction_amount
from bank_account_details a inner join bank_account_transaction b
on a.Account_Number = b.Account_Number) xx;


-- Q9: 
select a.customer_id, a.account_number,a.balance_amount,b.transaction_amount
from bank_account_details a inner join bank_account_transaction b
on (a.account_number = b.account_number)
where b. transaction_date between '2020-03-01' and '2020-04-30';

-- Q10:
select a.customer_id, a.account_number,a.balance_amount,b.transaction_amount, b. transaction_date
from bank_account_details a inner join bank_account_transaction b 
on (a.account_number = b.account_number)
where b. transaction_date not like('2020-03%');



