const ProductSchema = mongoose.Schema({
  // unique product id
  product_id: {
    type: Number,
    unique: true,
    required: true
  },
  // {true, false}
  total_recommended: {
    type: Object,
    unique: true,
    required: true
  },
  // {fit, length, comfort, quality}
  avg_characteristics: {
    type: Object,
    unique: true,
    required: true
  },
  // {1, 2, 3, 4, 5}
  total_ratings: {
    type: Object,
    unique: true,
    required: true
  },
  // [...reviews]
  // db.ReviewSchema.find({product_id: product_id}).populate('total_reviews');
  // something along these lines
  total_reviews: {
    type: Array,
    unique: true,
    required: true
  },
});

const ReviewSchema = mongoose.Schema({
  // unique product id, will be referenced by product schema for total_reviews when searching find()
  product_id: {
    type: Number,
    unique: true,
    required: true
  },
  // unique review_id
  review_id: {
    type: Number,
    unique: true,
    required: true
  },
  // number from 1-5
  rating: {
    type: Number,
    unique: true,
    required: true
  },
  // string of max length 60
  summary: {
    type: String,
    unique: true,
    required: true
  },
  // string of length 50 - 1000
  body: {
    type: String,
    unique: true,
    required: true
  },
  // date format (Month DD, YYYY)
  date: {
    type: Date,
    unique: true,
    required: true
  },
  // True/ False
  recommended: {
    type: Boolean,
    unique: true,
    required: true
  },
  // {fit, length, comfort, quality}
  characteristics: {
    type: Object,
    unique: true,
    required: true
  },
  // True/ False
  helpfulness: {
    type: Boolean,
    unique: true,
    required: true
  },
  // [...photos_url]
  photos: {
    type: Array,
    unique: true,
    required: true
  },
  // string of unspecified length
  reviewer_name: {
    type: String,
    unique: true,
    required: true
  },
  // string in email format
  email: {
    type: String,
    unique: true,
    required: true
  }
})