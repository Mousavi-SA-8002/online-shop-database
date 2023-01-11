INSERT INTO `online shop`.`category`
(`name`)
VALUES
('کالای دیجیتال');


INSERT INTO `online shop`.`category`
(`name`,
`parent_category_id`)
VALUES
('گوشی موبایل',
1);


INSERT INTO `online shop`.`category`
(`name`,
`parent_category_id`)
VALUES
('گوشی هوشمند',
2);


INSERT INTO `online shop`.`product`
(`Name`,
`Brand`,
`Description`,
`category_id`)
VALUES
('آیفون 13',
'Apple',
'Apple iPhone 13',
3);


INSERT INTO `online shop`.`product_model`
(`name`,
`weight`,
`product_id`)
VALUES
('مشکی 128 گیگ',
173,
1);


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


INSERT INTO `online shop`.`profile`
(`username`,
`password`,
`email`,
`mobile`)
VALUES
('dummyusername',
'dummypassword',
'dummyemail@dummyserver.com',
'09998887766');


INSERT INTO `online shop`.`customer`
(`full_name`,
`profile_id`)
VALUES
('مشتری الکی',
1);


INSERT INTO `online shop`.`address`
(`name`,
`city`,
`street`,
`detail`,
`postal_code`,
`profile_id`)
VALUES
('خانه',
'مشهد',
'کوثر',
'کثر 10، پلاک 22، واحد 5',
'9856123247',
1);


INSERT INTO `online shop`.`shop`
(`name`)
VALUES
('فروشگاه موبایل الکی');
INSERT INTO `online shop`.`wallet`
(`balance`,
`customer_id`,
`customer_profile_id`)
VALUES
(100000,
1,
1);


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


INSERT INTO `online shop`.`invoice`
(`amount`,
`status`,
`gateway_authority`,
`reference_id`,
`payment_gateway_id`)
VALUES
(100000,
1,
'dummygatewayauthority',
'dummypaymentreferenceid',
1);


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