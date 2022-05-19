create table matches_history
(
    id          bigserial
        primary key,
    id_user1    integer not null
        references users,
    score_user1 integer default 0,
    id_user2    integer not null
        references users,
    score_user2 integer default 0,
    winner      integer not null
        references users,
    constraint matches_history_check
        check (id_user1 < id_user2)
);
CREATE TABLE rooms (
	id SERIAL PRIMARY KEY,
    room_name VARCHAR(30),
    description TEXT
);
CREATE TABLE messages (
	id BIGSERIAL PRIMARY KEY,
	room_id INTEGER NOT NULL REFERENCES rooms(id) ON DELETE CASCADE,
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	content TEXT
);
CREATE TABLE participants (
	id BIGSERIAL PRIMARY KEY,
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	room_id INTEGER NOT NULL REFERENCES rooms(id) ON DELETE CASCADE
);
CREATE INDEX idx_messages_rooms
ON messages (room_id);