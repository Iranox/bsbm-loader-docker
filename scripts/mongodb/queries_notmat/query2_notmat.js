use bsbm;
db.setProfilingLevel(2)
db.getCollectionNames()
db.product.aggregate([ {$match: {nr:20}}, {$lookup: {from: "producer", localField: "producer", foreignField: "nr", as:"pr" }}, {$lookup: {  from: "productfeatureproduct", localField: "nr",foreignField: "product",as:"pfp" }},{ $project: {_id:0, propertyTex1:1, propertyTex2:1, propertyTex3:1,propertyNum1:1, propertyNum2:1, propertyTex4:1, propertyTex5:1, propertyNum4:1,"pfp.productFeature":1,comment:1,"pr.nr":1}}])
db.system.profile.find().pretty()
