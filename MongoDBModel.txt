const ProductSchema = mongoose.Schema({
  // unique product id
  product_id: {
    type: Number,
    unique: true
  },
  // {true, false}
  total_recommended: Object,
  // {fit, length, comfort, quality}
  avg_characteristics: Object,
  // {1, 2, 3, 4, 5}
  total_ratings: Object,
  // [...reviews]
  // db.ReviewSchema.find({product_id: product_id}).populate('total_reviews');
  // something along these lines
  total_reviews: Array
});

/*
validator: {
  $jsonSchema: {
    bsonType: "object",
    required: ["product_id", "total_recommended", "avg_characteristics", "total_ratings", "total_reviews"],
    properties: {
      product_id: {
        bsonType: "int",
        description: "must be the unique product id and is required"
      },
      total_recommended: {
        bsonType: "object",
        enum: ["true", "false"],
        properties: {
          true: {
            bsonType: "int",
            minimum: 0,
            description: "total number of recommended and is required"
          },
          false: {
            bsonType: "int",
            minimum: 0,
            description: "total number of not recommended and is required"
          }
        }
      },
      avg_characteristics: {
        bsonType: "object",
        enum: ["fit", "length", "comfort", "quality"],
        properties: {
          fit: {
            bsonType: "int",
            minimum: 0,
            maximum: 5,
            description: "average rating on product's fit and is required"
          },
          length: {
            bsonType: "int",
            minimum: 0,
            maximum: 5,
            description: "average rating on product's length and is required"
          },
          comfort: {
            bsonType: "int",
            minimum: 0,
            maximum: 5,
            description: "average rating on product's comfort and is required"
          },
          quality: {
            bsonType: "int",
            minimum: 0,
            maximum: 5,
            description: "average rating on product's quality and is required"
          }
        }
      },
      total_ratings: {
        bsonType: "object",
        required: ["1", "2", "3", "4", "5"],
        properties: {
          1: {
            bsonType: "int",
            minimum: 0,
            description: "total number of 1 star ratings and is required"
          },
          2: {
            bsonType: "int",
            minimum: 0,
            description: "total number of 2 star ratings and is required"
          },
          3: {
            bsonType: "int",
            minimum: 0,
            description: "total number of 3 star ratings and is required"
          },
          4: {
            bsonType: "int",
            minimum: 0,
            description: "total number of 4 star ratings and is required"
          },
          5: {
            bsonType: "int",
            minimum: 0,
            description: "total number of 5 star ratings and is required"
          }
        }
      },
      total_reviews: {
        bsonType: "array",
        items: {
          bsonType: "object",
          required: ["review_id", "rating", "summary", "body", "date", "recommended", "characteristics", "helpfulness", "photos", "reviewer_name", "email"]
        },
        properties: {
          review_id: {
            bsonType: "int",
            description: "unique review id and is required"
          },
          rating: {
            bsonType: "int",
            min: 0,
            max: 5,
            description: "that review's rating on product and is required"
          },
          summary: {
            bsonType: "string",
            maxLength: 60,
            description: "that review's summary on product and is required"
          },
          body: {
            bsonType: "string",
            minLength: 50,
            maxLength: 1000,
            description: "that review's body on product and is required"
          },
          date: {
            bsonType: "date",
            description: "that review's date on product and is required"
          },
          recommended: {
            bsonType: "boolean",
            description: "that review's recommended status on product and is required"
          },
          characteristics: {
            bsonType: "object",
            enum: ["fit", "length", "comfort", "quality"],
            properties: {
              fit: {
                bsonType: "int",
                minimum: 0,
                maximum: 5,
                description: "rating on product's fit and is required"
              },
              length: {
                bsonType: "int",
                minimum: 0,
                maximum: 5,
                description: "rating on product's length and is required"
              },
              comfort: {
                bsonType: "int",
                minimum: 0,
                maximum: 5,
                description: "rating on product's comfort and is required"
              },
              quality: {
                bsonType: "int",
                minimum: 0,
                maximum: 5,
                description: "rating on product's quality and is required"
              }
            }
          },
          helpfulness: {
            bsonType: "boolean",
            description: "that review's helpfulness status on product and is required"
          },
          photos: {
            bsonType: "array",
            items: {
              bsonType: "string",
              description: "url of photos uploaded and is required"
            }
          },
          reviewer_name: {
            bsonType: "string",
            description: "reviewer's nickname on that review and is required"
          },
          email: {
            bsonType: "email",
            description: "reviewer's email address on that review and is required"
          }
        }
      }
    }
  }
}
*/
const ReviewSchema = mongoose.Schema({
  // unique product id, will be referenced by product schema for total_reviews when searching find()
  product_id: Number,
  // unique review_id
  review_id: Number,
  // number from 1-5
  rating: Number,
  // string of max length 60
  summary: String,
  // string of length 50 - 1000
  body: String,
  // date format (Month DD, YYYY)
  date: Date,
  // True/ False
  recommended: Boolean,
  // {fit, length, comfort, quality}
  characteristics: Object,
  // True/ False
  helpfulness: Boolean,
  // [...photos_url]
  photos: Array,
  // string of unspecified length
  reviewer_name: String,
  // string in email format
  email: String
})