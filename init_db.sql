CREATE DATABASE hat_game WITH OWNER = hat_user;

\connect hat_game
CREATE SCHEMA game;

\connect hat_user
CREATE SCHEMA "user";