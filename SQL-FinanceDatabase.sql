create database if not exists asset_management;
use asset_management;
CREATE TABLE portfolio (portfolio_id varchar(50) primary key, 
portfolio_name varchar(50), portfolio_manager varchar(50),
asset_class ENUM('equity', 'fixedIncome', 'multiAsset'), inseption_date Date);
CREATE TABLE IF NOT EXISTS fund_positions (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    portfolio_id varchar(50),
    security_id varchar(50),
    security_name VARCHAR(255),
    quantity_held DECIMAL(15,2),
    current_value DECIMAL(15,2),
    date DATE,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id),
	FOREIGN KEY (security_id) REFERENCES security_master(security_id)

);
drop table fund_performance;
create table fund_performance(performance_id varchar(10) primary key, portfolio_id varchar(50),
date Date, performance Decimal,
 foreign key (portfolio_id) references portfolio(portfolio_id));
 create table security_master(security_id varchar(50) primary key,
 sedol varchar(7), isin varchar(100),company_name varchar(50), coupon Decimal, maturity_date Date);
 -- Data
 INSERT INTO portfolio (portfolio_id, portfolio_name, portfolio_manager, asset_class, inseption_date) VALUES
('P1', 'Global Equities Fund', 'Jane Doe', 'equity', '2020-01-01'),
('P2', 'Corporate Bond Fund', 'John Smith', 'fixedIncome', '2021-02-01'),
('P3', 'Balanced Fund', 'Emily Davis', 'multiAsset', '2022-03-01'),
('P4', 'High Yield Fund', 'Michael Brown', 'fixedIncome', '2020-04-01'),
('P5', 'Tech Growth Fund', 'Linda Green', 'equity', '2021-05-01'),
('P6', 'Emerging Markets Fund', 'Brian Wilson', 'equity', '2022-06-01'),
('P7', 'Government Bond Fund', 'Nancy White', 'fixedIncome', '2020-07-01'),
('P8', 'Sustainable Energy Fund', 'Carol Harris', 'equity', '2021-08-01'),
('P9', 'Real Estate Investment Fund', 'Gary Martin', 'multiAsset', '2022-09-01'),
('P10', 'Commodity Fund', 'Sandra Clark', 'multiAsset', '2020-10-01');
INSERT INTO fund_positions (portfolio_id, security_id, security_name, quantity_held, current_value, date) VALUES
('P1', 'S1', 'Tech Innovations Corp', 1000, 50000.00, '2024-01-01'),
('P2', 'S2', 'Global Energy Ltd', 200, 10000.00, '2024-01-02'),
('P3', 'S3', 'Health Solutions Inc', 500, 25000.00, '2024-01-03'),
('P4', 'S4', 'Auto Innovations Inc', 1500, 60000.00, '2024-01-04'),
('P5', 'S5', 'Financial Health Group', 700, 35000.00, '2024-01-05'),
('P6', 'S6', 'Global Telecom', 800, 24000.00, '2024-01-06'),
('P7', 'S7', 'Consumer Retail Group', 900, 45000.00, '2024-01-07'),
('P8', 'S8', 'Industrial Solutions Inc', 300, 15000.00, '2024-01-08'),
('P9', 'S9', 'Pharmaceutical Leaders', 400, 20000.00, '2024-01-09'),
('P10', 'S10', 'NextGen Tech Ltd', 1100, 55000.00, '2024-01-10');

INSERT INTO fund_positions (portfolio_id, security_id, security_name, quantity_held, current_value, date) VALUES
('P1', 'S7', 'Global Energy Ltd', 3000, 70000.00, '2024-03-01'),
('P1', 'S5', 'Health Solutions Inc', 9000, 20000.00, '2024-05-01'),
('P1', 'S6', 'Global Telecom', 4000, 90000.00, '2024-09-01'),
('P2', 'S6', 'Global Energy Ltd', 200, 10000.00, '2024-01-02'),
('P2', 'S3', 'Health Solutions Inc', 500, 25000.00, '2024-01-02'),
('P2', 'S9', 'Auto Innovations Inc', 1500, 60000.00, '2024-01-02');


INSERT INTO security_master (security_id, sedol, isin, company_name, coupon, maturity_date) VALUES
('S1', 'B123456', 'US0000001', 'Tech Innovations Corp', NULL, NULL),
('S2', 'B654321', 'US0000002', 'Global Energy Ltd', 5.0, '2030-01-01'),
('S3', 'B987654', 'US0000003', 'Health Solutions Inc', NULL, NULL),
('S4', 'B234567', 'US0000004', 'Auto Innovations Inc', NULL, NULL),
('S5', 'B345678', 'US0000005', 'Financial Health Group', 4.5, '2029-01-01'),
('S6', 'B456789', 'US0000006', 'Global Telecom', NULL, NULL),
('S7', 'B567890', 'US0000007', 'Consumer Retail Group', NULL, NULsecurity_idsecurity_idL),
('S8', 'B678901', 'US0000008', 'Industrial Solutions Inc', 5.5, '2031-01-01'),
('S9', 'B789012', 'US0000009', 'Pharmaceutical Leaders', NULL, NULL),
('S10', 'B890123', 'US0000010', 'NextGen Tech Ltd', NULL, NULL);

INSERT INTO fund_performance (performance_id, portfolio_id, date, performance) VALUES
('FP1', 'P1', '2024-01-31', 8.5),
('FP2', 'P2', '2024-02-28', 5.0),
('FP3', 'P3', '2024-03-31', 7.0),
('FP4', 'P4', '2024-04-30', 4.5),
('FP5', 'P5', '2024-05-31', 9.0),
('FP6', 'P6', '2024-06-30', 6.5),
('FP7', 'P7', '2024-07-31', 3.5),
('FP8', 'P8', '2024-08-31', 8.0),
('FP9', 'P9', '2024-09-30', 5.5),
('FP10', 'P10', '2024-10-31', 7.5);
INSERT INTO fund_performance (performance_id, portfolio_id, date, performance) VALUES
('FP11', 'P1', '2024-02-28', 8.8),
('FP12', 'P1', '2024-03-31', 8.2),
('FP13', 'P1', '2024-04-30', 8.6),
('FP14', 'P1', '2024-05-31', 9.1),
('FP15', 'P1', '2024-06-30', 9.3);

INSERT INTO fund_performance (performance_id, portfolio_id, date, performance) VALUES
('FP16', 'P2', '2024-03-31', 5.3),
('FP17', 'P2', '2024-04-30', 4.8),
('FP18', 'P2', '2024-05-31', 5.5),
('FP19', 'P2', '2024-06-30', 5.1),
('FP20', 'P2', '2024-07-31', 5.6);

