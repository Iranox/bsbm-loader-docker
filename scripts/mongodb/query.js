use bsbm;
db.offer.find({"nr":50},{_id:0, nr:0}
db.offer.aggregate([{$match: {nr:50}},{ $project: {_id:0,product:1, producer:1,vendor:1, price:1, validFrom:1, validTo:1, deliveryDays:1, offerWebpage:1, publisher:1, publishDate:1}}])
db.product.aggregate([ {$match: {nr:20}}, {$lookup: {from: "producer", localField: "producer", foreignField: "nr", as:"pr" }}, {$lookup: {  from: "productfeatureproduct", localField: "nr",foreignField: "product",as:"pfp" }},{ $project: {_id:0, propertyTex1:1, propertyTex2:1, propertyTex3:1,propertyNum1:1, propertyNum2:1, propertyTex4:1, propertyTex5:1, propertyNum4:1,"pfp.productFeature":1,comment:1,"pr.nr":1}}])
