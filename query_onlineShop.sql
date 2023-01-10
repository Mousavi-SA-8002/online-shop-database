/*نمایش لیست محصولات */
select product.Name
from `online shop`.product;


/*نمایش لیست کاربرها */
SELECT full_name
FROM `online shop`.`customer`;



/*نمایش لیست دسته بندی محصولات*/
SELECT name
FROM `online shop`.`category`;


/*نمایش لیست سفارش ها*/
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



/*نمایش لیست فروشنده های یک آیتم */
SELECT product.Name ,shop.name
FROM `online shop`.shop_item ,`online shop`.shop,`online shop`.product ,`online shop`.product_model
where product_id=product_model_id=product_model_product_id and shop_item.shop_id=shop_id
group by product_id;



/* نمایش 10 سفارش آخر کاربر  */
select *
from `online shop`.orders
where orders.id in(
    select order_id
    from orders,wallet_transactions,wallet,customer
    where wallet_transactions.order_id=order_id and wallet.id=wallet_transactions.wallet_id AND wallet.customer_id=customer_id
    order by orders.datetime desc
    limit 10

    )



/* کاربران مربوط به یک شهر*/
SELECT distinct customer.full_name ,address.city
FROM `online shop`.customer  ,`online shop`.address
where  customer.id=address.profile_id and address.city='مشهد';




/*تامین کنندگان کالا مربوط به یک شهر*/
select distinct supplier.name
from `online shop`.supplier
where supplier.cty='مشهد';




/*نظرات داده شده در رابطه با محصول*/
select comment.text
from `online shop`.shop_item , `online shop`.comment
where shop_item.id=comment.shop_item.id
order by comment.date;
