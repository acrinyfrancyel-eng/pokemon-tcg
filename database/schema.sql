-- PostgreSQL schema for Pokémon TCG

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE pokemon (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type_id INT REFERENCES types(id),
    hp INT NOT NULL,
    attack INT NOT NULL,
    defense INT NOT NULL,
    special_attack INT NOT NULL,
    special_defense INT NOT NULL,
    speed INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE moves (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type_id INT REFERENCES types(id),
    power INT,
    accuracy INT,
    pp INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE abilities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE team_members (
    id SERIAL PRIMARY KEY,
    team_id INT REFERENCES teams(id),
    pokemon_id INT REFERENCES pokemon(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE battles (
    id SERIAL PRIMARY KEY,
    team1_id INT REFERENCES teams(id),
    team2_id INT REFERENCES teams(id),
    winner_id INT REFERENCES teams(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);