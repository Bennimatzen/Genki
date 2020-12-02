# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_02_141013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appointment_summaries", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.text "content"
    t.text "plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "unread", default: true
    t.index ["appointment_id"], name: "index_appointment_summaries_on_appointment_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "appointment_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "record_share"
    t.bigint "user_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "reason"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_chats_on_doctor_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_diseases_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "specialty"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.boolean "unread", default: true
    t.bigint "chat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "prescription_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "prescription_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pharmacy_id"
    t.index ["pharmacy_id"], name: "index_orders_on_pharmacy_id"
    t.index ["prescription_id"], name: "index_orders_on_prescription_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "prescription_checks", force: :cascade do |t|
    t.boolean "done"
    t.boolean "reminder"
    t.datetime "end"
    t.bigint "prescription_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prescription_id"], name: "index_prescription_checks_on_prescription_id"
    t.index ["user_id"], name: "index_prescription_checks_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "name"
    t.string "dose"
    t.string "frequency"
    t.bigint "doctor_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.string "sku"
    t.integer "duration"
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "symptom_checks", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "symptom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symptom_id"], name: "index_symptom_checks_on_symptom_id"
    t.index ["user_id"], name: "index_symptom_checks_on_user_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name"
    t.bigint "disease_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disease_id"], name: "index_symptoms_on_disease_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.integer "nhs_number"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointment_summaries", "appointments"
  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "users"
  add_foreign_key "chats", "doctors"
  add_foreign_key "chats", "users"
  add_foreign_key "diseases", "users"
  add_foreign_key "doctors", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "prescriptions"
  add_foreign_key "orders", "users"
  add_foreign_key "prescription_checks", "prescriptions"
  add_foreign_key "prescription_checks", "users"
  add_foreign_key "prescriptions", "doctors"
  add_foreign_key "prescriptions", "users"
  add_foreign_key "symptom_checks", "symptoms"
  add_foreign_key "symptom_checks", "users"
  add_foreign_key "symptoms", "diseases"
end
