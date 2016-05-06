db.product_matComplex.aggregate([{$lookup: { from: "producttypeproduct", localField: "nr",foreignField: "product",as: "type"}},{$out:"product_feature_typ"}])
