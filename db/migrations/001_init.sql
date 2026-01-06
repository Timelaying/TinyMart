CREATE TABLE IF NOT EXISTS products (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
price_cents INT NOT NULL CHECK (price_cents >= 0),
stock_qty INT NOT NULL CHECK (stock_qty >= 0),
created_at TIMESTAMPTZ DEFAULT now()
);


CREATE TABLE IF NOT EXISTS orders (
id SERIAL PRIMARY KEY,
status TEXT NOT NULL CHECK (status IN ('PENDING','PAID','CANCELLED')),
total_cents INT NOT NULL CHECK (total_cents >= 0),
created_at TIMESTAMPTZ DEFAULT now()
);


CREATE TABLE IF NOT EXISTS order_items (
order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
product_id INT NOT NULL REFERENCES products(id),
qty INT NOT NULL CHECK (qty > 0),
price_cents INT NOT NULL CHECK (price_cents >= 0),
PRIMARY KEY (order_id, product_id)
);


CREATE INDEX IF NOT EXISTS idx_order_items_product ON order_items(product_id);