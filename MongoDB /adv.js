db.books.countDocuments()
db.books.countDocuments({ year: {$gt: 2000} })

db.books.find().sort({ year: 1 })     // ascending
db.books.find().sort({ year: -1 })    // descending

db.books.find().skip(5).limit(5)

db.books.aggregate([
  { $group: { _id: null, avgYear: { $avg: "$publication_year" } } }
])

db.books.aggregate([
  { $group: { _id: "$genre", total: { $sum: 1 } } }
])

db.books.aggregate([
  { $group: { _id: "$genre", total: { $sum: 1 } } },
  { $sort: { total: -1 } }
])

db.books.find({}, { title: 1, author: 1, _id: 0 })
db.books.find({}, { ISBN: 0 })
db.books.createIndex({ title: "text", author: "text" })
db.books.find({ $text: { $search: "Road" } })
db.books.find({ title: { $regex: /^The/i } })    // starts with The
db.books.find({ author: { $regex: /Lee$/i } })   // ends with Lee
db.books.updateMany({}, { $inc: { rating: 1 } })
db.books.findOneAndUpdate(
  { title: "Gatsby" },
  { $set: { genre: "Classic" } },
  { returnNewDocument: true }
)
db.books.findOneAndDelete({ title: "1984" })
