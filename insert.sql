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
--                     discount_code
/******************************************************/

INSERT INTO `online shop`.`discount_code` (code, amount, current_life, initial_life)
VALUES ('1234',0,5,5);

/******************************************************/
--                     product_model
/******************************************************/

INSERT INTO `online shop`.`product_model` (id, name, weight, product_id)
VALUES (1,'pro','124',1);

INSERT INTO `online shop`.`product_model` (id, name, weight, product_id)
VALUES (2,'pro max','145',1);

INSERT INTO `online shop`.`product_model` (id, name, weight, product_id)
VALUES (3,'pro','124',2);

INSERT INTO `online shop`.`product_model` (id, name, weight, product_id)
VALUES (4,'pro360','1245',11);

INSERT INTO `online shop`.`product_model` (id, name, weight, product_id)
VALUES (5,'ferion','5k',22);

INSERT INTO `online shop`.`product_model` (id, name, weight, product_id)
VALUES (6,'چوبی قرمز','10k',31);

INSERT INTO `online shop`.`product_model` (id, name, weight, product_id)
VALUES (7,'قهوه ای','50k',32);

INSERT INTO `online shop`.`product_model` (id, name, weight, product_id)
VALUES (8,'meshki','50',41);


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

INSERT INTO `online shop`.`shop` (id, name)
VALUES (1,'فروشگاه لوازم خانگی');

INSERT INTO `online shop`.`shop` (id, name)
VALUES (2,'فروشگاه گوشی');

INSERT INTO `online shop`.`shop` (id, name)
VALUES (3,'فروشگاه لوازم آشپزخانه');

INSERT INTO `online shop`.`shop` (id, name)
VALUES (4,'فروشگاه لوازم اتاق خواب');

INSERT INTO `online shop`.`shop` (id, name)
VALUES (5,'فروشگاه لباس');

/******************************************************/
--                     wallet
/******************************************************/

INSERT INTO `online shop`.`wallet` (balance, customer_id, customer_profile_id)
VALUES (50000,1,1);

INSERT INTO `online shop`.`wallet` (balance, customer_id, customer_profile_id)
VALUES (40000,2,2);

INSERT INTO `online shop`.`wallet` (balance, customer_id, customer_profile_id)
VALUES (30000,3,3);

INSERT INTO `online shop`.`wallet` (balance, customer_id, customer_profile_id)
VALUES (70000,4,4);

INSERT INTO `online shop`.`wallet` (balance, customer_id, customer_profile_id)
VALUES (80000,5,5);

/******************************************************/
--                     payment_gateway
/******************************************************/

INSERT INTO `online shop`.`payment_gateway` (id, name, bank, endpoint, token, is_active)
VALUES (1,'درگاه بانک ملت','ملت','https://bankmellat.ir/online/payment','dummygatewaytoken',1);

/******************************************************/
--                     orders
/******************************************************/

INSERT INTO `online shop`.`orders` (datetime, total_product_price, total_weight, shipping_method, shipping_price, total_price, total_price_with_discount_code, status, discount_code_id, address_idaddress, address_profile_id)
VALUES (curdate(),50000,173,'پست پیشتاز',1000,51000,51000,1,1,1,1);

INSERT INTO `online shop`.`orders` (datetime, total_product_price, total_weight, shipping_method, shipping_price, total_price, total_price_with_discount_code, status, discount_code_id, address_idaddress, address_profile_id)
VALUES (curdate(),60000,155,'پست پیشتاز',1000,61000,61000,1,1,2,2);

INSERT INTO `online shop`.`orders` (datetime, total_product_price, total_weight, shipping_method, shipping_price, total_price, total_price_with_discount_code, status, discount_code_id, address_idaddress, address_profile_id)
VALUES (curdate(),20000,73,'پست پیشتاز',1000,21000,21000,1,1,3,3);

INSERT INTO `online shop`.`orders` (datetime, total_product_price, total_weight, shipping_method, shipping_price, total_price, total_price_with_discount_code, status, discount_code_id, address_idaddress, address_profile_id)
VALUES (curdate(),30000,13,'پست پیشتاز',1000,31000,31000,1,1,4,4);

INSERT INTO `online shop`.`orders` (datetime, total_product_price, total_weight, shipping_method, shipping_price, total_price, total_price_with_discount_code, status, discount_code_id, address_idaddress, address_profile_id)
VALUES (curdate(),40000,123,'پست پیشتاز',1000,41000,41000,1,1,5,5);

/******************************************************/
--                     invoice
/******************************************************/

insert into `online shop`.invoice (amount, status, gateway_authority, reference_id, order_id, payment_gateway_id)
VALUES (7000,1,'melat','melat.ir',1,1);

INSERT INTO `online shop`.`invoice`(amount, status, gateway_authority, reference_id, order_id, payment_gateway_id)
VALUES (100000,1,'dummygatewayauthority','dummypaymentreferenceid',2,1);

insert into `online shop`.invoice (amount, status, gateway_authority, reference_id, order_id, payment_gateway_id)
VALUES (8000,1,'melat3','melat3.ir',3,1);

insert into `online shop`.invoice (amount, status, gateway_authority, reference_id, order_id, payment_gateway_id)
VALUES (9000,1,'melat4','melat4.ir',4,1);

insert into `online shop`.invoice (amount, status, gateway_authority, reference_id, order_id, payment_gateway_id)
VALUES (5000,1,'melat5','melat5.ir',5,1);

/******************************************************/
--                     wallet_transactions
/******************************************************/

INSERT INTO `online shop`.`wallet_transactions` (amount, datetime, balance, wallet_id, order_id, invoice_id)
VALUES (7000,curdate(),70000,1,1,1);

INSERT INTO `online shop`.`wallet_transactions` (amount, datetime, balance, wallet_id, order_id, invoice_id)
VALUES (8000,curdate(),80000,2,2,2);

INSERT INTO `online shop`.`wallet_transactions` (amount, datetime, balance, wallet_id, order_id, invoice_id)
VALUES (6000,curdate(),60000,3,3,3);

INSERT INTO `online shop`.`wallet_transactions` (amount, datetime, balance, wallet_id, order_id, invoice_id)
VALUES (4000,curdate(),40000,4,4,4);

INSERT INTO `online shop`.`wallet_transactions` (amount, datetime, balance, wallet_id, order_id, invoice_id)
VALUES (5000,curdate(),50000,5,5,5);

/******************************************************/
--                     shop_item
/******************************************************/

INSERT INTO `online shop`.`shop_item` (id, product_model_id, product_model_product_id, shop_id, stock, price, discount)
VALUES (1,1,1,1,10,99000,0);

/******************************************************/
--                     order_items
/******************************************************/

INSERT INTO `online shop`.`order_items` (orders_id, shop_item_id, shop_item_product_model_id, shop_item_product_model_product_id, shop_item_shop_id, price_single, quantity, price_total)
VALUES (1,1,1,1,1,4000,2,8000);

/******************************************************/
--                     order_items
/******************************************************/

INSERT INTO `online shop`.`comment` (idcomment, score, text, product_id, product_category_id, profile_id)
VALUES (1,1,'salam 10',1,12,1);

INSERT INTO `online shop`.`comment` (idcomment, score, text, product_id, product_category_id, profile_id)
VALUES (2,2,'salam 20',1,12,2);

INSERT INTO `online shop`.`comment` (idcomment, score, text, product_id, product_category_id, profile_id)
VALUES (3,3,'salam 30',1,12,3);

INSERT INTO `online shop`.`comment` (idcomment, score, text, product_id, product_category_id, profile_id)
VALUES (4,4,'salam 40',1,12,4);

INSERT INTO `online shop`.`comment` (idcomment, score, text, product_id, product_category_id, profile_id)
VALUES (5,5,'salam 50',1,12,5);