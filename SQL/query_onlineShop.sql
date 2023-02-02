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



/*نمایش لیست 10 کاربر برتر ماه  */
SELECT c.full_name ,sum(wt.amount) as total
FROM `online shop`.wallet_transactions as wt left join `online shop`.wallet as w on wt.wallet_id=w.id
left join `online shop`.customer as c on w.customer_id=c.id
where wt.datetime>(select now() - interval 30 day )
group by customer_id
order by total desc limit 10


/*نمایش لیست 10 کاربر برتر هفته  */
SELECT c.full_name ,sum(wt.amount) as total
FROM `online shop`.wallet_transactions as wt left join `online shop`.wallet as w on wt.wallet_id=w.id
left join `online shop`.customer as c on w.customer_id=c.id
where wt.datetime>(select now() - interval 1 week )
group by customer_id
order by total desc limit 10


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
select customer.full_name,orders.id,orders.datetime,orders.total_price
from `online shop`.orders ,`online shop`.customer
where customer.full_name='Seyed Ali Mousavi' and orders.address_profile_id=customer.profile_id and orders.id in(
    select order_id
    from orders,wallet_transactions,wallet,customer
    where wallet_transactions.order_id=order_id and wallet.id=wallet_transactions.wallet_id AND wallet.customer_id=customer_id
    order by orders.datetime desc
    /*limit 10*/

    );



/* کاربران مربوط به یک شهر*/
SELECT distinct customer.full_name ,address.city
FROM `online shop`.customer  ,`online shop`.address
where  customer.id=address.profile_id and address.city='مشهد';




/*تامین کنندگان کالا مربوط به یک شهر*/
select distinct supplier.name
from `online shop`.supplier
where supplier.city='مشهد';




/*نظرات داده شده در رابطه با یک محصول*/
select comment.text
from `online shop`.shop_item , `online shop`.comment
where shop_item.id=comment.product_id
order by comment.idcomment;



/*نمایش 3 نظری که بهترین امتیاز را به محصول داده اند*/
select comment.text,comment.score
from `online shop`.shop_item , `online shop`.comment
where shop_item.id=comment.product_id
order by comment.score desc limit 3;



/*نمایش 3 نظری که کمترین امتیاز را به محصول داده اند*/
select comment.text,comment.score
from `online shop`.shop_item , `online shop`.comment
where shop_item.id=comment.product_id
order by comment.score asc limit 3;


/*نمایش لیست ارزان فروش ترین فروشنده آیتم*/
select shop.name,shop_item.price
from `online shop`.shop ,`online shop`.shop_item,`online shop`.product_model,`online shop`.product
where shop_item.shop_id=shop.id and shop_item.product_model_product_id=product_id
order by shop_item.price asc limit 1;




/*نمایش لیست پر فروش ترین محصولات هفته*/
select p.Name ,sum(i.quantity) as total
from `online shop`.orders left join `online shop`.order_items as i on orders.id=i.orders_id left join `online shop`.product as p on i.shop_item_product_model_product_id=p.id
where orders.datetime>(select now() - interval 1 week )
group by i.shop_item_product_model_id 
order by total desc limit 5





/*نمایش لیست پر فروش ترین محصولات ماه*/
select p.Name ,sum(i.quantity) as total
from `online shop`.orders left join `online shop`.order_items as i on orders.id=i.orders_id left join `online shop`.product as p on i.shop_item_product_model_product_id=p.id
where orders.datetime>(select now() - interval 30 day )
group by i.shop_item_product_model_id 
order by total desc limit 5

