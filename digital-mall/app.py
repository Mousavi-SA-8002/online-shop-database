from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
from flask.views import MethodView
from flask import jsonify, request

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:12663503@localhost/mydb'
db = SQLAlchemy(app)


class ItemAPI(MethodView):
    init_every_request = False

    def __init__(self, model):
        self.model = model

    def _get_item(self, id):
        if self.model is Address:
            return self.model.query.filter_by(idaddress=id).first()
        else:
            return self.model.query.filter_by(id=id).first()

    def get(self, id):
        item = self._get_item(id)
        return jsonify(as_dict(item))

    def patch(self, id):
        item = self._get_item(id)

        for k, v in request.json:
            if k == 'id' or k == 'idaddress':
                continue
            setattr(item, k, v)
        db.session.commit()
        return jsonify(as_dict(item))

    def delete(self, id):
        item = self._get_item(id)
        db.session.delete(item)
        db.session.commit()
        return "", 204

class GroupAPI(MethodView):
    init_every_request = False

    def __init__(self, model):
        self.model = model

    def get(self):
        items = self.model.query.all()
        return jsonify([as_dict(item) for item in items])

    def post(self):
        new_item = self.model(**request.json)
        db.session.add(new_item)
        db.session.commit()
        return jsonify(as_dict(new_item))

def register_api(app, model, name):
    item = ItemAPI.as_view(f"{name}-item", model)
    group = GroupAPI.as_view(f"{name}-group", model)
    app.add_url_rule(f"/api/{name}/<int:id>", view_func=item)
    app.add_url_rule(f"/api/{name}/", view_func=group)

def dict_result(result):
    if result is not None:
        return [dict(e._mapping) for e in result if e is not None]
    else:
        return [{}]

@app.route('/top_10_users/')
@app.route('/top_10_users/<int:period>')
def top_10_users(period=30):
    result = db.session.execute(text('''
        SELECT c.id, c.full_name, SUM(ABS(wt.amount)) as total_expense
        FROM wallet_transactions as wt JOIN wallet as w ON wt.wallet_id=w.id
        JOIN customer as c ON w.customer_id=c.id
        WHERE wt.datetime > (select now() - interval {} day)
        GROUP BY c.id, c.full_name
        ORDER BY total_expense DESC
    '''.format(period))).all()
    return jsonify(dict_result(result))


@app.route('/special_offers/')
def special_offers():
    result = db.session.execute(text('''
        SELECT s.name as shop_name,
        p.name as product_name,
        pm.name as product_model,
        si.discount as discount
        FROM shop as s
        JOIN shop_item as si ON si.shop_id=s.id
        JOIN product_model as pm ON pm.id=si.product_model_id
        JOIN product as p ON p.id=pm.product_id
        WHERE si.discount > 15
    ''')).all()
    return jsonify(dict_result(result))

@app.route('/shops_having_product/<int:product_id>')
def shops_having_product(product_id):
    result = db.session.execute(text('''
        SELECT s.id, s.name
        FROM shop as s
        WHERE s.id IN (SELECT distinct(s.id)
        FROM shop as s
        JOIN shop_item as si ON s.id=si.shop_id
        JOIN product as p ON si.product_model_product_id=p.id
        WHERE p.id={})
    '''.format(product_id))).all()
    return jsonify(dict_result(result))

@app.route('/user_orders/<int:user_id>')
def user_orders(user_id):
    result = db.session.execute(text('''
        SELECT * FROM orders
        WHERE address_profile_id={}
        ORDER BY datetime DESC
    '''.format(user_id))).all()
    return jsonify(dict_result(result))

@app.route('/customers_of_city/<string:city>')
def customers_of_city(city):
    result = db.session.execute(text('''
        SELECT distinct customer.full_name ,address.city
        FROM customer, address
        where  customer.id=address.profile_id and address.city='{}';
    '''.format(city))).all()
    return jsonify(dict_result(result))

@app.route('/suppliers_of_city/<string:city>')
def suppliers_of_city(city):
    result = db.session.execute(text('''
        select distinct supplier.name
        from supplier
        where supplier.city='{}';
    '''.format(city))).all()
    return jsonify(dict_result(result))

if __name__ == "__main__":
    from models import *
    register_api(app, Profile, "profiles")
    register_api(app, Cart, "carts")
    register_api(app, Address, "addresses")
    register_api(app, Customer, "customers")
    register_api(app, Wallet, "wallets")
    register_api(app, WalletTransaction, "wallet_transactions")
    register_api(app, PaymentGateway, "payment_gateways")
    register_api(app, Invoice, "invoices")
    register_api(app, Order, "orders")
    register_api(app, DiscountCode, "discount_codes")
    register_api(app, Shop, "shops")
    register_api(app, ShopItem, "shop_items")
    register_api(app, PriceHistory, "price_history")
    register_api(app, Product, "products")
    register_api(app, ProductModel, "product_models")
    register_api(app, ModelAttribute, "model_attributes")
    register_api(app, Category, "categories")

    app.run(debug=True)