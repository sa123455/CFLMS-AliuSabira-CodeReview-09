--1.Count home many mails were sent from vienna--
SELECT count(address.city)
FROM drop_off
INNER JOIN address ON
address.address_id=drop_off.fk_address_id
WHERE address.city='vienna';

--2.Count home many mails were sent from Linz--
SELECT count(address.city)
FROM drop_off
INNER JOIN address ON
address.address_id=drop_off.fk_address_id
WHERE address.city='linz';

--3.show first and last name from customer droped-off mail in Linz--

SELECT customer.first_name,customer.last_name
FROM drop_off
INNER JOIN address ON
address.address_id=drop_off.fk_address_id
INNER JOIN customer ON
customer.customer_id=drop_off.fk_customer_id
WHERE address.city='linz';

--4.show customer first and last name that sent mail on 2020-01-12 and the type of the mail

SELECT customer.first_name, customer.last_name,package.type,drop_off.drop_off_date
FROM customer
INNER JOIN drop_off ON
customer.customer_id=drop_off.fk_customer_id
INNER JOIN package ON
package.package_id=drop_off.fk_package_id
WHERE drop_off.drop_off_date='2020-01-12';

--5.show customer first name, last name and email who picked up his package betweenn --
--2020-02-11 and 2020-03-11--

SELECT customer.first_name,customer.last_name,customer.email,pick_up.pick_up_date
FROM pick_up
INNER JOIN customer ON
customer.customer_id=pick_up.fk_customer_id
WHERE pick_up.pick_up_date BETWEEN '2020-02-11' AND '2020-03-11';

--6.show all the mails that are deposited
SELECT *
FROM processing_station
WHERE date_deposited IS NOT NULL;

--7.show all the mails that are deposited OR were received on 2020-02-10--
SELECT *
FROM processing_station
WHERE date_deposited IS NOT NULL OR date_received = '2020-02-10';

--8.join 5 tabels--
SELECT employee.emp_first_name, processing_station.time_received,package.type,transport_vans.van_model
FROM processing_station
INNER JOIN employee ON
processing_station.fk_employee_id=employee.employee_id
INNER JOIN package ON
package.package_id=processing_station.fk_package_id
INNER JOIN transport_vans ON
employee.employee_id=transport_vans.fk_employee_id;

--9. show addres and telephon number of customer whose last name contains a followed by l
SELECT customer.last_name,customer.phone_number,address.street,address.street_no
FROM customer
INNER JOIN address ON
customer.fk_address_id=address.address_id


