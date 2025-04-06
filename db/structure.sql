CREATE TABLE IF NOT EXISTS "taggings" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "tag_id" integer, "taggable_type" varchar, "taggable_id" integer, "tagger_type" varchar, "tagger_id" integer, "context" varchar(128), "created_at" datetime);
CREATE TABLE sqlite_sequence(name,seq);
CREATE INDEX "index_taggings_on_context" ON "taggings" ("context");
CREATE UNIQUE INDEX "taggings_idx" ON "taggings" ("tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type");
CREATE INDEX "index_taggings_on_tag_id" ON "taggings" ("tag_id");
CREATE INDEX "index_taggings_on_taggable_id_and_taggable_type_and_context" ON "taggings" ("taggable_id", "taggable_type", "context");
CREATE INDEX "taggings_idy" ON "taggings" ("taggable_id", "taggable_type", "tagger_id", "context");
CREATE INDEX "index_taggings_on_taggable_id" ON "taggings" ("taggable_id");
CREATE INDEX "index_taggings_on_taggable_type" ON "taggings" ("taggable_type");
CREATE INDEX "index_taggings_on_tagger_id_and_tagger_type" ON "taggings" ("tagger_id", "tagger_type");
CREATE INDEX "index_taggings_on_tagger_id" ON "taggings" ("tagger_id");
CREATE TABLE IF NOT EXISTS "tags" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "taggings_count" integer DEFAULT 0);
CREATE UNIQUE INDEX "index_tags_on_name" ON "tags" ("name");
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar, "encrypted_password" varchar(128), "salt" varchar(128), "confirmation_token" varchar(128), "remember_token" varchar(128), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_users_on_email" ON "users" ("email");
CREATE INDEX "index_users_on_remember_token" ON "users" ("remember_token");
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "service_name" varchar NOT NULL, "byte_size" bigint NOT NULL, "checksum" varchar, "created_at" datetime(6) NOT NULL);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" bigint NOT NULL, "blob_id" bigint NOT NULL, "created_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE TABLE IF NOT EXISTS "active_storage_variant_records" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "blob_id" bigint NOT NULL, "variation_digest" varchar NOT NULL, CONSTRAINT "fk_rails_993965df05"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE UNIQUE INDEX "index_active_storage_variant_records_uniqueness" ON "active_storage_variant_records" ("blob_id", "variation_digest");
CREATE TABLE IF NOT EXISTS "tracks" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "display_title" varchar, "description" text, "recorded_on" datetime, "created_at" datetime, "updated_at" datetime, "author" varchar, "published" boolean);
CREATE VIRTUAL TABLE track_searches using fts5(title, description, track_id)
/* track_searches(title,description,track_id) */;
CREATE TABLE IF NOT EXISTS 'track_searches_data'(id INTEGER PRIMARY KEY, block BLOB);
CREATE TABLE IF NOT EXISTS 'track_searches_idx'(segid, term, pgno, PRIMARY KEY(segid, term)) WITHOUT ROWID;
CREATE TABLE IF NOT EXISTS 'track_searches_content'(id INTEGER PRIMARY KEY, c0, c1, c2);
CREATE TABLE IF NOT EXISTS 'track_searches_docsize'(id INTEGER PRIMARY KEY, sz BLOB);
CREATE TABLE IF NOT EXISTS 'track_searches_config'(k PRIMARY KEY, v) WITHOUT ROWID;
INSERT INTO "schema_migrations" (version) VALUES
('20250408194132'),
('20250406021648'),
('20220602152546'),
('20220602152545'),
('20220602152544'),
('20200112011715'),
('20200112011714'),
('20200105010611'),
('20191116180814'),
('20170927054329'),
('20160925185148'),
('20160925185147'),
('20160925185146'),
('20160925185145'),
('20160925185144'),
('20130220053343'),
('20130218205159'),
('20130218205018'),
('20130218055315'),
('20130218052949');

