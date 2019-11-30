

ActiveRecord::Schema.define(version: 2019_11_29_020637) do

  create_table "lists", force: :cascade do |t|
    t.string "task"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
