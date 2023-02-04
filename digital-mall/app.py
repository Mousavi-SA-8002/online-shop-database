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
        return self.model.query.get_or_404(id)

    def get(self, id):
        item = self._get_item(id)
        return jsonify(as_dict(item))

    def patch(self, id):
        item = self._get_item(id)

        item.update_from_json(request.json)
        db.session.commit()
        return jsonify(item.to_json())

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
        db.session.add(self.model.from_json(request.json))
        db.session.commit()
        return jsonify(request.json)

def register_api(app, model, name):
    item = ItemAPI.as_view(f"{name}-item", model)
    group = GroupAPI.as_view(f"{name}-group", model)
    app.add_url_rule(f"/{name}/<int:id>", view_func=item)
    app.add_url_rule(f"/{name}/", view_func=group)



if __name__ == "__main__":
    from models import *
    register_api(app, Profile, "profiles")
    print('here')
    app.run(debug=True)