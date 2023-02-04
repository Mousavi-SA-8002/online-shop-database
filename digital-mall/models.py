from app import db, app

with app.app_context():
    db.Model.metadata.reflect(bind=db.engine,schema='mydb')

class Profile(db.Model):    
    cart = db.relationship('Cart', backref='profile', uselist=False)
    customer = db.relationship('Customer', backref='profile', uselist=False)
    addresses = db.relationship('Address', backref='profile')
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
    # can have a single order
    
    # can have a single order
    
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
    __table__ = db.Model.metadata.tables['mydb.orders']

class DiscountCode(db.Model):
    orders = db.relationship('Order', backref='discount_code')
    __table__ = db.Model.metadata.tables['mydb.discount_code']

if __name__ == "__main__":
    pass