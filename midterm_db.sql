
--setup for our database schema--
CREATE DATABASE midterm;
USE midterm;

--USERS table--
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

--RESOURCES table--
CREATE TABLE resources (
    id INTEGER PRIMARY KEY,
    resource_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

--COMMENTS table--
CREATE TABLE comments (
    id INTEGER PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    resource_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(resource_id) REFERENCES resources(id)
);


--LIKES table--
CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    resource_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(resource_id) REFERENCES resources(id),
    PRIMARY KEY(user_id, resource_id)
);

--RATINGS table--
CREATE TABLE ratings (
    user_id INTEGER NOT NULL,
    resource_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    value INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(resource_id) REFERENCES resources(id),
    PRIMARY KEY(user_id, resource_id)
);


--TAGS table--
CREATE TABLE tags (
  id INTEGER PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

--RESOURCE TAGS table--
CREATE TABLE resource_tags (
    resource_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(resource_id) REFERENCES resources(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(resource_id, tag_id)
);



