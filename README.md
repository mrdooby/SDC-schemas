Requirements for Schema Approval

Requirements:

Your schema must be fully written out.
- In SQL, or CQL, or Code (e.g., a Mongoose schema), etc. -- whatever is required to actually create the tables/collections.
- Do not show us a picture and say, “This is my schema!” A diagram of table relationships is not nearly as detailed as a fully written schema.
- The details ARE what matter when it comes to database design, so unless the schema is written out in all its glorious details, we cannot give you useful feedback.

You should be able to support all the API routes (Products), (Q&A), (Reviews)
- Your schema should support all the routes listed on the API at a minimum.
- You can think about improved routes and data shapes as well and possible other routes.
- Remember your DB choices are for your service. The frontend uses all the services. Since each group member has a - distinctive service they can be using different databases. Note this will mimic real life tech companies which often use multiple databases!

Your schema should contain constraints
- Ask yourself, "How would I maintain the integrity of my database?" (Examples: should this field be unique? Should this field ever be empty? Should this field only ever contain one of three specific strings? Etc.)
- Without constraints, a database will inevitably fill up with incorrect, duplicate, and incomplete records. This is a NIGHTMARE to deal with (and I'm speaking from experience).
- Your database should protect its own data integrity, not rely on others to be careful about what they put into it.
- You cannot depend on users, employers, other employees, and third-party developers to be detail-oriented about the quality of the data they try to write to your database. You must make it impossible for them to do it wrong!



Schema Design Cheat Sheet
General Tips

Names should be consistent (for tables/keys/columns)
- If you use dashes to separate words (or underscores, or camelcase) you should consistently use that pattern everywhere in your schema.

Names should communicate clearly what the data represents
- Use simple, one-word nouns when possible
- A developer who is not familiar with your project should be able to easily tell what the names mean (avoid things like unnecessary abbreviations)
  - For example: don't name a column co_date (for checkout date) when you could use checkout_date. Or better still, just call the column checkout (the datatype of that field will make it clear that it is a date).

Pay special attention to one-to-many relationships (try to model these realistically)
- Nearly every module should have multiple tables/collections.
  - It is important to get some experience with joins, or combining data from multiple collections. Without these joins, there's not much challenge in "optimizing" your database.
- Don't, for instance, create a schema that has a user field without a corresponding user table/collection.

Look for opportunities to add constraints
- Use foreign keys where appropriate
- Every table needs a primary key
- Should this value ever be null?
- Is there a default value for a certain field?
- Should there be a cascade on delete?
- Should this field always have a unique value?

Be on the lookout for unintentional denormalization.
- Usually some kind of "count" or "total" field.

Optimize your data types
- Save space on characters (set a reasonable limit). For instance, a username field should likely be capped at 20 - 50 characters in an SQL schema. Using something like the TEXT data type just wastes space on your database
- Is this field only ever going to store a number between 1 and 6? Don't use the datatype INTEGER, because that can - store massive numbers. Use a SMALL INT.
- Use enums when there are a small number of set values for a column
- Use the DATE type for dates
