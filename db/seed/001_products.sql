INSERT INTO products (name, price_cents, stock_qty)
VALUES ('Coffee Beans', 1200, 20),
('Tea Pack', 800, 30),
('Mug', 600, 15)
ON CONFLICT DO NOTHING;