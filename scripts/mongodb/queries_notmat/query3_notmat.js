use bsbm;
db.setProfilingLevel(2)
db.getCollectionNames()
db.productfeatureproduct.aggregate([{$match: {product:20}},{$project: {"productFeature":1}},{$lookup: {from: "productfeatureproduct", localField: "productFeature", foreignField: "productFeature", as:"pfp1" }},{$project: {"product":"$pfp1.product"}},{$unwind: "$product"},{$group: {_id:'$product'}}, {$lookup: {  from: "product", localField: "_id",foreignField: "nr",as:"p" }},{$unwind: "$p"}, {$lookup: {  from: "product", localField: "p.vendor",foreignField: "vendor",as:"po" }},{$unwind:"$po"},{$match:{"po.nr":20}},{$match:{ "po.nr": { $ne:"p.nr" }}},{$project: {_id:"$_id", label: "$p.label"}}]).pretty()
db.system.profile.find().pretty()
