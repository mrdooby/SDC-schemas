// -- reviews.csv
// -- id,product_id,rating,date,summary,body,recommend,reported,reviewer_name,reviewer_email,response,helpfulness

const ReviewsSchema = mongoose.Schema({
  _id: {
    type: Number,
    unique: true,
    required: true
  },
  product_id: {
    type: Number,
    required: true
  },
  rating: {
    type: Number,
    required: true
  },
  date: {
    type: Date,
    required: true
  },
  summary: {
    type: String,
    required: true
  },
  body: {
    type: String,
    required: true
  },
  recommend: {
    type: Boolean,
    required: true,
  },
  reported: {
    type: Boolean,
    required: true,
  },
  reviewer_name: {
    type: String,
    required: true,
    unique: true
  },
  reviewer_email: {
    type: String,
    required: true,
    unique: true
  },
  response: {
    type: String,
  },
  helpfulness: {
    type: Number,
    required: true
  }
});
const Reviews = mongoose.model('Reviews', ReviewsSchema);
// -- characteristics_reviews.csv
// -- id,characteristic_id,review_id,value

const CharacteristicsReviewsSchema = mongoose.Schema({
  _id: {
    type: Number,
    unique: true,
    required: true
  },
  characteristic_id: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Characteristics"
  },
  value: {
    type: Number,
    required: true
  }
});
const CharacteristicsReviews = mongoose.model('CharacteristicReviews', CharacteristicsReviewsSchema);
// -- reviews_photos.csv
// -- id,review_id,url

const ReviewsPhotosSchema = mongoose.Schema({
  _id: {
    type: Number,
    required: true,
    unique: true
  },
  review_id: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Reviews"
  }
});
const ReviewsPhotos = mongoose.model('ReviewsPhotos', ReviewsPhotosSchema);

// -- characteristics.csv
// -- id,product_id,name
const Characteristics = mongoose.Schema({
  _id: {
    type: Number,
    required: true,
    unique: true
  },
  product_id: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Reviews"
  },
  name: {
    type: String,
    required: true,
    enum: ['Fit', 'Length', 'Comfort', 'Quality']
  }
})