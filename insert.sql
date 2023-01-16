/******************************************************/
--                     category
/******************************************************/

INSERT INTO `online shop`.`category`(id, name)
VALUES (1,'کالای دیجیتال');

INSERT INTO `online shop`.`category` (id, name, parent_category_id)
VALUES (11,'لپ تاپ',1),
       (12,'گوشی هوشمند',1);

INSERT INTO `online shop`.`category` (id, name)
VALUES (2,'لوازم خانگی');

INSERT INTO `online shop`.`category` (id, name, parent_category_id)
VALUES (21,'لوازم آشپزخانه',2),
       (22,'لوازم اتاق',2);

INSERT INTO `online shop`.`category` (id, name)
VALUES (3,'پوشاک');

/******************************************************/
--                     product
/******************************************************/

INSERT INTO `online shop`.`product` (id, Name, Brand, Description, category_id)
VALUES (1,'آیفون 13','Apple 13','Apple iPhone 13',12),
       (2,'آیفون 14','Apple 14','Apple iPhone 14',12);

INSERT INTO `online shop`.`product` (id, Name, Brand, Description, category_id)
VALUES (11,'ASUS360','Asus','asus360 asus',11),
       (12,'ZBook15','HP','ZBook15 HP',11);

INSERT INTO `online shop`.`product` (id, Name, Brand, Description, category_id)
VALUES (21,'یخچال','Samsung','یخچال سامسونگ',21),
       (22,'گاز','سامسونگ','گاز سامسونگ',21);

INSERT INTO `online shop`.`product` (id, Name, Brand, Description, category_id)
VALUES (31,'نخت خواب','چوبی','نخت خواب چوبی',22),
       (32,'کمد','MDF','کمد MDF',22);

INSERT INTO `online shop`.`product` (id, Name, Brand, Description, category_id)
VALUES (41,'پیراهن','مخمل','پیراهن مخمل',3),
       (42,'شرت','بتمن','شرت بتمن',3);

/******************************************************/
--                     product_model
/******************************************************/

INSERT INTO `online shop`.`product_model`
(`name`,
`weight`,
`product_id`)
VALUES
('مشکی 128 گیگ',
173,
1);

/******************************************************/
--                     model_attribute
/******************************************************/

INSERT INTO `online shop`.`model_attribute`
(`attribute_name`,
`attribute_value`,
`product_model_id`,
`product_model_product_id`)
VALUES
('Color',
'Black',
1,
1);

INSERT INTO `online shop`.`model_attribute`
(`attribute_name`,
`attribute_value`,
`product_model_id`,
`product_model_product_id`)
VALUES
('Memory',
'128GB',
1,
1);

/******************************************************/
--                     profile
/******************************************************/

INSERT INTO `online shop`.`profile` (id, username, password, email, mobile)
VALUES (1,'Mousavi','mousavi1234','mousavi@gmail.com','09027628608');

INSERT INTO `online shop`.`profile` (id, username, password, email, mobile)
VALUES (2,'reza saat','reza@2002','asnaasharyreza89@gmail.com','09309086506');

INSERT INTO `online shop`.`profile` (id, username, password, email, mobile)
VALUES (3,'Mirrashid','Mirrashid1234','mirrashid@gmail.com','09220858202');

INSERT INTO `online shop`.`profile` (id, username, password, email, mobile)
VALUES (4,'Farokh','farokh1234','farokh@gmail.com','09936722536');

INSERT INTO `online shop`.`profile` (id, username, password, email, mobile)
VALUES (5,'Nasehiyan','nasehiyan1234','nasehiyan@gmail.com','09027939237');

/******************************************************/
--                     customer
/******************************************************/

INSERT INTO `online shop`.`customer` (id, full_name, profile_id)
VALUES (1,'Seyed Ali Mousavi',1);

INSERT INTO `online shop`.`customer` (id, full_name, profile_id)
VALUES (2,'Reza Asnaashary',2);

INSERT INTO `online shop`.`customer` (id, full_name, profile_id)
VALUES (3,'MohammadReza Mirrashid',3);

INSERT INTO `online shop`.`customer` (id, full_name, profile_id)
VALUES (4,'Reza farokh',4);

INSERT INTO `online shop`.`customer` (id, full_name, profile_id)
VALUES (5,'Mahdi Nasehiyan',5);

/******************************************************/
--                     address
/******************************************************/

INSERT INTO `online shop`.`address` (idaddress, name, city, street, detail, postal_code, profile_id)
VALUES (1,'خونه صیاد','مشهد','صیاد شیرازی','صیاد شیرازی 55','9178916879',1);

INSERT INTO `online shop`.`address` (idaddress, name, city, street, detail, postal_code, profile_id)
VALUES (2,'خونه هفت تیر','مشهد','هفت تیر','هفت تیر 11','9133316879',2);

INSERT INTO `online shop`.`address` (idaddress, name, city, street, detail, postal_code, profile_id)
VALUES (3,'خونه دلاوران','مشهد','دلاوران','دلاوران 28','9133311234',3);

INSERT INTO `online shop`.`address` (idaddress, name, city, street, detail, postal_code, profile_id)
VALUES (4,'خونه آزادی','تهران','آزادی','آزادی 59','8533311234',4);

INSERT INTO `online shop`.`address` (idaddress, name, city, street, detail, postal_code, profile_id)
VALUES (5,'خونه اندیشه','کرمان','اندیشه','اندیشه 87','4533251234',5);

/******************************************************/
--                     shop
/******************************************************/

INSERT INTO `online shop`.`shop`
(`name`)
VALUES
('فروشگاه موبایل الکی');

/******************************************************/
--                     wallet
/******************************************************/

INSERT INTO `online shop`.`wallet`
(`balance`,
`customer_id`,
`customer_profile_id`)
VALUES
(100000,
1,
1);

/******************************************************/
--                     payment_gateway
/******************************************************/

INSERT INTO `online shop`.`payment_gateway`
(`name`,
`bank`,
`endpoint`,
`token`,
`is_active`)
VALUES
('درگاه بانک ملت',
'ملت',
'https://bankmellat.ir/online/payment',
'dummygatewaytoken',
1);

/******************************************************/
--                     invoice
/******************************************************/

insert into `online shop`.invoice (amount, status, gateway_authority, reference_id, order_id, payment_gateway_id)
                            VALUES (7000    ,1      ,'melat'        ,'melat.ir'     ,1         ,1);

INSERT INTO `online shop`.`invoice`(amount, status, gateway_authority, reference_id, order_id, payment_gateway_id)
VALUES (100000,1,'dummygatewayauthority','dummypaymentreferenceid',1,1);

INSERT INTO `online shop`.`invoice`
(`amount`,
`status`,
`gateway_authority`,
`reference_id`,
`order_id`,
`payment_gateway_id`)
VALUES
(51000,
1,
'dummygatewayauthority2',
'dummypaymentreferenceid2',
1,
1);

/******************************************************/
--                     wallet_transactions
/******************************************************/

INSERT INTO `online shop`.`wallet_transactions`
(`amount`,
`datetime`,
`balance`,
`wallet_id`,
`invoice_id`)
VALUES
(100000,
CURDATE(),
100000,
1,
1);

/******************************************************/
--                     shop_item
/******************************************************/

INSERT INTO `online shop`.`shop_item`
(`product_model_id`,
`product_model_product_id`,
`shop_id`,
`stock`,
`price`,
`discount`)
VALUES
(1,
1,
1,
10,
50000,
0);

/******************************************************/
--                     orders
/******************************************************/

INSERT INTO `online shop`.`orders`
(`datetime`,
`total_product_price`,
`total_weight`,
`shipping_method`,
`shipping_price`,
`total_price`,
`total_price_with_discount_code`,
`status`,
`address_idaddress`,
`address_profile_id`)
VALUES
(curdate(),
50000,
173,
'پست پیشتاز',
1000,
51000,
51000,
1,
1,
1);

/******************************************************/
--                     order_items
/******************************************************/

INSERT INTO `online shop`.`order_items`
(`orders_id`,
`shop_item_id`,
`shop_item_product_model_id`,
`shop_item_product_model_product_id`,
`shop_item_shop_id`,
`price_single`,
`quantity`,
`price_total`)
VALUES
(1,
1,
1,
1,
1,
50000,
1,
50000);

















INSERT INTO `online shop`.`address` (idaddress, name, city, street, detail, postal_code, profile_id)
VALUES
(2,'خانه' ,
'سبزوار',
'معلم',
'معلم 10، پلاک 21، واحد 2',
'6556123247',
2);
INSERT INTO `online shop`.`shop`
(`name`)
VALUES
('فروشگاه موبایل واقعی');
INSERT INTO `online shop`.`wallet`
(`balance`,
`customer_id`,
`customer_profile_id`)
VALUES
(500000,
2,
2);

INSERT INTO `online shop`.`invoice` (amount, status, gateway_authority, reference_id, order_id, payment_gateway_id)
VALUES
(800000,
1,
'mmdrezaygatewayauthority',
'mmdrezamentreferenceid',
1,1);
INSERT INTO `online shop`.`wallet_transactions`
(`amount`,`datetime`,
`balance`,
`wallet_id`,
`invoice_id`)
VALUES
(700000,
CURDATE(),
100000,
2,
2);

insert into `online shop`.wallet_transactions
    (amount, datetime, balance, wallet_id, invoice_id)
values (500 , curdate(), 5,      2,          3);