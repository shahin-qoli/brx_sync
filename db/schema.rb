# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_02_135103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribute_mappings", force: :cascade do |t|
    t.bigint "equivalent_id"
    t.string "source_attribute"
    t.string "equivalent_attribute"
    t.string "fixed_amount"
    t.boolean "uniquer", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equivalent_id"], name: "index_attribute_mappings_on_equivalent_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.jsonb "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equivalentment_requests", force: :cascade do |t|
    t.bigint "raw_document_id"
    t.jsonb "request_body"
    t.boolean "is_success"
    t.jsonb "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["raw_document_id"], name: "index_equivalentment_requests_on_raw_document_id"
  end

  create_table "equivalents", force: :cascade do |t|
    t.bigint "document_id"
    t.jsonb "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_equivalents_on_document_id"
  end

  create_table "raw_documents", force: :cascade do |t|
    t.jsonb "raw_data"
    t.string "document_source"
    t.integer "job_id"
    t.boolean "is_synced", default: false
    t.bigint "equivalent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equivalent_id"], name: "index_raw_documents_on_equivalent_id"
  end

end
