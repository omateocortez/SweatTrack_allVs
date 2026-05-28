-- SweatTrack v2 - Admin migration
-- Run: mysql -u root -p sweattrack < database/migration_admin.sql
-- Safe to re-run: most statements use IF NOT EXISTS or INSERT IGNORE

USE sweattrack;

-- Add is_admin flag (skip if already exists)
ALTER TABLE users ADD COLUMN is_admin TINYINT(1) NOT NULL DEFAULT 0;

-- Ensure role ENUM includes 'doctor' and 'admin'
ALTER TABLE users MODIFY COLUMN role ENUM('athlete','nutritionist','coach','admin','doctor') DEFAULT 'athlete';

-- Extend notifications type to support admin requests
ALTER TABLE notifications
  MODIFY COLUMN type ENUM('hydration','nutrition','recovery','alert','admin_request') DEFAULT 'hydration';

-- Add meta and action_taken to notifications
ALTER TABLE notifications
  ADD COLUMN meta JSON NULL,
  ADD COLUMN action_taken TINYINT(1) NOT NULL DEFAULT 0;

-- Super admin (password: Admin@SweatTrack2025)
INSERT IGNORE INTO users (name, email, password_hash, role, clinic_name, is_admin)
VALUES (
  'Admin SweatTrack',
  'admin@sweattrack.com',
  '$2b$10$L/6ZqTXVNoKd7MqBuSe49OLDBQjTULYDdI8T1LJyaebFiYCgrI0Ta',
  'admin',
  'SweatTrack',
  1
);

-- Ensure athlete_profile row for admin
INSERT IGNORE INTO athlete_profiles (user_id)
SELECT id FROM users WHERE email = 'admin@sweattrack.com';
