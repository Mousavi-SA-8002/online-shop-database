/*نمایش لیست محصولات */
select product.Name
from `online shop`.product;


/*نمایش لیست کاربرها */
SELECT full_name
FROM `online shop`.`customer`;



/*نمایش لیست دسته بندی محصولات*/
SELECT name
FROM `online shop`.`category`;


/*نمایش لیست دسته بندی محصولات*/
SELECT *
FROM `online shop`.orders;


/*fix later*/
/*نمایش لیست 10 کاربر برتر هفته و ماه */
SELECT customer.full_name, sum(amount)
FROM `online shop`.wallet_transactions,`online shop`.wallet ,`online shop`.customer
where wallet.id=wallet_transactions.wallet_id AND wallet.customer_id=customer_id
group by customer_id;


/*نمایش لیست پیشنهادات ویژه*/
SELECT product.Name
 FROM `online shop`.shop_item ,`online shop`.product ,`online shop`.product_model
 where product_id=product_model_id=product_model_product_id And shop_item.discount>15;