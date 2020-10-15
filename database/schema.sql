CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    image_url TEXT
);


INSERT INTO dishes (name, image_url) VALUES ('Cake', 'https://www.farmhouseonboone.com/wp-content/uploads/2020/05/gluten-free-lemon-cake-15-scaled-720x720.jpg'), ('ribs', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F608875.jpg&q=85');
