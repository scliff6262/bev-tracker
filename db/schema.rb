# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180309223717) do

  create_table "beverages", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "rating"
    t.text "comments"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
  end

end

#user1 = User.create(first_name: "Sean", last_name: "Clifford", email: "cliff80@rocketmail.com", username: "scliff6", password: "password1")
user1.beverages.build(name: "Ground Effect Cabernet", category: "Wine", rating: 3, comments: "really nice red wine, earthy palate")
