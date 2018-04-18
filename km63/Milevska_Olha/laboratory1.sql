/*---------------------------------------------------------------------------
1.Створити схему даних з назвою – прізвище студента, у якій користувач може: 
видаляти таблиці та робити запити з таблиць
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:
CREATE USER milevska IDENTIFIED BY milevska64
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

ALTER USER milevska QUOTA 100M ON USERS;
GRANT "CONNECT" TO milevska;  

GRANT SELECT ANY TABLE TO milevska;
GRANT DROP ANY TABLE TO milevska;


/*---------------------------------------------------------------------------
2. Створити таблиці, у яких визначити поля та типи. Головні та зовнішні ключі 
створювати окремо від таблиць використовуючи команди ALTER TABLE. 
На комп'ютері встановлено OS Windows.
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:

CREATE TABLE user(
    user_name VARCHAR2(20) NOT NULL
);


ALTER TABLE user
ADD CONSTRAINT user_name_pk PRIMARY KEY (user_name);

CREATE TABLE os(
    os_name VARCHAR2(20)
); 

ALTER TABLE os
ADD CONSTRAINT os_name_pk PRIMARY KEY (os_name);    

CREATE TABLE user_os(
    user_name_fk VARCHAR(20) NOT NULL
    os_name_fk VARCHAR2(20) NOT NULL
);

ALTER TABLE user_os
ADD CONSTRAINT user_os_pk PRIMARY KEY (user_name_fk,os_name_fk );    

ALTER TABLE user_os
ADD CONSTRAINT user_name_fk FOREIGN KEY (user_name_fk) REFERENCES (user_name);

ALTER TABLE user_os
ADD CONSTRAINT os_name_fk FOREIGN KEY (os_name_fk) REFERENCES (os_name);








  
/* --------------------------------------------------------------------------- 
3. Надати додаткові права користувачеві (створеному у пункті № 1) для створення таблиць, 
внесення даних у таблиці та виконання вибірок використовуючи команду ALTER/GRANT. 
Згенерувати базу даних використовуючи код з теки OracleScript та виконати запити: 

---------------------------------------------------------------------------*/
--Код відповідь:
GRANT CREATE ANY TABLE TO milevska;
GRANT INSERT ANY TABLE TO milevska;
GRANT SELECT ANY TABLE TO milevska;




/*---------------------------------------------------------------------------
3.a. 
Як звуть покупців, що не купляли найдешевший товар.
Виконати завдання в Алгебрі Кодда. 
4 бали
---------------------------------------------------------------------------*/

--Код відповідь:

SELECT CUST_NAME
FROM CUSTOMERS, ORDERITEMS, ORDERS
WHERE ITEM_PRICE NOT IN(
SELECT MIN(ITEM_PRICE)
FROM ORDERITEMS);



/*---------------------------------------------------------------------------
3.b. 
Вивести імена покупців, що не мають поштової адреси, але мають замовлення.
Виконати завдання в SQL. 
4 бали

---------------------------------------------------------------------------*/

--Код відповідь:















/*---------------------------------------------------------------------------
c. 
Вивести імена постачальників у верхньому регістрі,назвавши це поле vendor_name, що продають товар з найдовшим коментарем.
Виконати завдання в SQL. 
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:
