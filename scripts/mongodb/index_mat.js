db.offer.createIndex({"nr":1})
db.product.createIndex({"nr":1})
db.producer.createIndex({"nr":1})
db.product.createIndex({"nr":1})
db.productfeature.createIndex({"nr":1})
db.producttype.createIndex({"nr":1})
db.review.createIndex({"nr":1})
db.vendor.createIndex({"nr":1})


db.product.createIndex({"propertyNum1":1})
db.product.createIndex({"propertyNum2":1})
db.product.createIndex({"propertyNum3":1})
db.product.createIndex({"propertyNum4":1})

db.offer.createIndex({"deliveryDays":1})
db.offer.createIndex({"validFrom":1})
db.offer.createIndex({"validTo":1})
db.offer.createIndex({"product":1})



db.offer.createIndex({"product.nr":1})
db.offer.createIndex({"product.nr":1, "vendor.country":1, "validFrom":1,"deliveryDays":1})
db.offer.createIndex({"product.nr":1, "vendor.country":1, "validFrom":1,"deliveryDays":1})
db.review.createIndex({"product":1, "language":1})
db.review.createIndex({"product":1})
db.review.createIndex({"product":1, "language":1})



db.product_matComplex.createIndex({"productfeature.nr":1, "propertyNum1":1})
db.product_matComplex.createIndex({"productfeature.nr":1, "propertyNum1":1, "nr":1, "propertyNum2":1})
db.product_matComplex.createIndex({"productfeature.nr":1, "propertyNum1":1, "nr":1, "propertyNum3":1})
db.product_feature_typ.createIndex({ "productfeature.nr":1})
db.product_feature_typ.createIndex({ "propertyNum3":1})
db.product_feature_typ.createIndex({"productfeature":1, "propertyNum1":1})
db.product_feature_typ.createIndex({"type":1, "propertyNum1":1})
db.producttypeproduct.createIndex({"product":1})
db.producttypeproduct.createIndex({"productType":1})

db.productfeatureproduct.createIndex({"productFeature":1})
db.productfeatureproduct.createIndex({"product":1})

