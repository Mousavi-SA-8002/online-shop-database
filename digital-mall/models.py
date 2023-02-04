from app import db, app

with app.app_context():
    db.Model.metadata.reflect(bind=db.engine,schema='mydb')

def as_dict(obj):
       return {c.name: str(getattr(obj, c.name)) for c in obj.__table__.columns}

class Profile(db.Model):    
    cart = db.relationship('Cart', backref='profile', uselist=False, lazy=True)
    customer = db.relationship('Customer', backref='profile', uselist=False, lazy=True)
    addresses = db.relationship('Address', backref='profile', lazy=True)
    __table__ = db.Model.metadata.tables['mydb.profile']

class Cart(db.Model):
    __table__ = db.Model.metadata.tables['mydb.cart']
    
class Address(db.Model):
    orders = db.relationship('Order', backref='address')
    __table__ = db.Model.metadata.tables['mydb.address']

class Customer(db.Model):
    wallet = db.relationship('Wallet', backref='customer', uselist=False)
    __table__ = db.Model.metadata.tables['mydb.customer']

class Wallet(db.Model):
    transactions = db.relationship('WalletTransaction', backref='wallet')
    __table__ = db.Model.metadata.tables['mydb.wallet']

class WalletTransaction(db.Model):
    __table__ = db.Model.metadata.tables['mydb.wallet_transactions']

class PaymentGateway(db.Model):
    # has many invoices
    invoices = db.relationship('Invoice', backref='payment_gateway')
    __table__ = db.Model.metadata.tables['mydb.payment_gateway']

class Invoice(db.Model):
    # 1-1 WalletTransaction can have an Invoice (upon charging wallet)
    # Invoice can have a wallet_transaction (if the invoice is for charging wallet)
    wallet_transaction = db.relationship('WalletTransaction', backref='invoice', uselist=False)
    __table__ = db.Model.metadata.tables['mydb.invoice']

class Order(db.Model):
    # 1-1 WalletTransaction can have an order (upon paying from wallet)
    # Order can have a wallet_transaction (if the order was payed with wallet)
    wallet_transaction = db.relationship('WalletTransaction', backref='order', uselist=False)
    # Set of invoices, can be empty, only one can be successful
    invoices = db.relationship('Invoice', backref='order')
    # items
    order_items = db.relationship('OrderItem', backref='order')
    __table__ = db.Model.metadata.tables['mydb.orders']

class DiscountCode(db.Model):
    orders = db.relationship('Order', backref='discount_code')
    __table__ = db.Model.metadata.tables['mydb.discount_code']

class Shop(db.Model):
    shop_items = db.relationship('ShopItem', backref='shop')
    __table__ = db.Model.metadata.tables['mydb.shop']

class ShopItem(db.Model):
    order_items = db.relationship('OrderItem', backref='shop_item')
    price_history = db.relationship('PriceHistory', backref='shop_item')
    __table__ = db.Model.metadata.tables['mydb.shop_item']

class PriceHistory(db.Model):
    __table__ = db.Model.metadata.tables['mydb.price_history']

class Product(db.Model):
    product_models = db.relationship('ProductModel', backref='product')
    __table__ = db.Model.metadata.tables['mydb.product']

class ProductModel(db.Model):
    shop_items = db.relationship('ShopItem', backref='product_model')
    model_attributes = db.relationship('ModelAttribute', backref='product_model')
    __table__ = db.Model.metadata.tables['mydb.product_model']

class ModelAttribute(db.Model):
    __table__ = db.Model.metadata.tables['mydb.model_attribute']

class OrderItem(db.Model):
    __table__ = db.Model.metadata.tables['mydb.order_items']

class Category(db.Model):
    __table__ = db.Model.metadata.tables['mydb.category']


if __name__ == "__main__":
    pass