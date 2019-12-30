-- +micrate Up
CREATE TABLE topics (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  forum_id BIGINT,
  title VARCHAR,
  content TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX topic_user_id_idx ON topics (user_id);
CREATE INDEX topic_forum_id_idx ON topics (forum_id);

-- +micrate Down
DROP TABLE IF EXISTS topics;
