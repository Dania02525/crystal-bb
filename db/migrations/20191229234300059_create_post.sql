-- +micrate Up
CREATE TABLE posts (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  topic_id BIGINT,
  content TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX post_user_id_idx ON posts (user_id);
CREATE INDEX post_topic_id_idx ON posts (topic_id);

-- +micrate Down
DROP TABLE IF EXISTS posts;
