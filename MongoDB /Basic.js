show dbs
use SchoolDB
show collections
db.createCollection("Students")
db.createCollection("Courses")

db.Students.insertOne({
    name: "Ali",
    age: 21,
    scores: { math: 88, science: 92 }
})

db.Courses.insertMany([
  { courseId: 1, instructor: "Dr. Smith", studentsEnrolled: [1,2,3] },
  { courseId: 2, instructor: "Dr. Adams", studentsEnrolled: [3,4] }
])

db.Students.findOne({ 
    "scores.math": { $gte: 85 },
    age: { $lt: 22 }
})

db.Students.find({ 
    "scores.math": { $gte: 80 },
    "scores.science": { $lt: 90 }
})

db.Students.updateOne(
   { name: "Bob", "scores.math": { $gte: 75 } },
   { $inc: { "scores.science": 5 } }
)

db.Students.updateMany(
  { "scores.science": { $lt: 80 }, age: { $gt: 22 } },
  { $inc: { "scores.math": 5 } }
)

db.Students.deleteOne({
    name: "Daisy",
    "scores.science": { $lt: 80 }
})

db.Courses.deleteMany({
    $or: [
        { studentsEnrolled: 2 },
        { instructor: "Dr. Smith" }
    ]
})
/*drop collection*/
db.Students.drop()
db.Courses.drop()
//drop db
db.dropDatabase()


