from flask import Flask
from flask_sqlalchemy import SQLAlchemy
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
    register_api(app, OrderItem, "order_items")
    register_api(app, Category, "categories")

    app.run(debug=True)