-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema online shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online shop` DEFAULT CHARACTER SET utf8 ;
USE `online shop` ;

-- -----------------------------------------------------
-- Table `online shop`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `parent_category_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_category1_idx` (`parent_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_category1`
    FOREIGN KEY (`parent_category_id`)
    REFERENCES `online shop`.`category` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`, `category_id`),
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `online shop`.`category` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`product_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`product_model` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `weight` VARCHAR(45) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`, `product_id`),
  INDEX `fk_product_model_product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_model_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `online shop`.`product` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`model_attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`model_attribute` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `attribute_name` VARCHAR(45) NOT NULL,
  `attribute_value` VARCHAR(45) NOT NULL,
  `product_model_id` INT NOT NULL,
  `product_model_product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_model_attribute_product_model1_idx` (`product_model_id` ASC, `product_model_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_model_attribute_product_model1`
    FOREIGN KEY (`product_model_id` , `product_model_product_id`)
    REFERENCES `online shop`.`product_model` (`id` , `product_id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mobile` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`id`, `profile_id`),
  INDEX `fk_customer_profile1_idx` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `online shop`.`profile` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`wallet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`wallet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `balance` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `customer_profile_id` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id`, `customer_profile_id`),
  INDEX `fk_wallet_customer1_idx` (`customer_id` ASC, `customer_profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_wallet_customer1`
    FOREIGN KEY (`customer_id` , `customer_profile_id`)
    REFERENCES `online shop`.`customer` (`id` , `profile_id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`discount_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`discount_code` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL,
  `current_life` INT NOT NULL,
  `initial_life` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`address` (
  `idaddress` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `detail` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`idaddress`, `profile_id`),
  INDEX `fk_address_profile1_idx` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `online shop`.`profile` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `datetime` DATETIME NOT NULL,
  `total_product_price` INT NOT NULL,
  `total_weight` INT NOT NULL,
  `shipping_method` VARCHAR(45) NOT NULL,
  `shipping_price` INT NOT NULL,
  `total_price` INT NOT NULL,
  `total_price_with_discount_code` INT NOT NULL,
  `status` INT NOT NULL,
  `discount_code_id` INT NULL,
  `address_idaddress` INT NOT NULL,
  `address_profile_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_discount_code1_idx` (`discount_code_id` ASC) VISIBLE,
  INDEX `fk_order_address1_idx` (`address_idaddress` ASC, `address_profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_discount_code1`
    FOREIGN KEY (`discount_code_id`)
    REFERENCES `online shop`.`discount_code` (`id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_order_address1`
    FOREIGN KEY (`address_idaddress` , `address_profile_id`)
    REFERENCES `online shop`.`address` (`idaddress` , `profile_id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`payment_gateway`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`payment_gateway` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `bank` VARCHAR(45) NULL,
  `endpoint` VARCHAR(45) NULL,
  `token` VARCHAR(45) NULL,
  `is_active` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`invoice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `status` INT NOT NULL,
  `gateway_authority` VARCHAR(45) NULL,
  `reference_id` VARCHAR(45) NULL,
  `order_id` INT NULL,
  `payment_gateway_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoice_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_invoice_payment_gateway1_idx` (`payment_gateway_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `online shop`.`orders` (`id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_invoice_payment_gateway1`
    FOREIGN KEY (`payment_gateway_id`)
    REFERENCES `online shop`.`payment_gateway` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`wallet_transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`wallet_transactions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `datetime` DATETIME NOT NULL,
  `balance` INT NOT NULL,
  `wallet_id` INT NOT NULL,
  `order_id` INT NULL,
  `invoice_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wallet_transactions_wallet1_idx` (`wallet_id` ASC) VISIBLE,
  INDEX `fk_wallet_transactions_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_wallet_transactions_invoice1_idx` (`invoice_id` ASC) VISIBLE,
  CONSTRAINT `fk_wallet_transactions_wallet1`
    FOREIGN KEY (`wallet_id`)
    REFERENCES `online shop`.`wallet` (`id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_wallet_transactions_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `online shop`.`orders` (`id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_wallet_transactions_invoice1`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `online shop`.`invoice` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`shop` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`shop_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`shop_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_model_id` INT NOT NULL,
  `product_model_product_id` INT NOT NULL,
  `shop_id` INT NOT NULL,
  `stock` INT NOT NULL,
  `price` INT NOT NULL,
  `discount` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `product_model_id`, `product_model_product_id`, `shop_id`),
  INDEX `fk_product_model_has_shop_shop1_idx` (`shop_id` ASC) VISIBLE,
  INDEX `fk_product_model_has_shop_product_model1_idx` (`product_model_id` ASC, `product_model_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_model_has_shop_product_model1`
    FOREIGN KEY (`product_model_id` , `product_model_product_id`)
    REFERENCES `online shop`.`product_model` (`id` , `product_id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_product_model_has_shop_shop1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `online shop`.`shop` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`supplier` (
  `idsupplier` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsupplier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `last_updated` DATETIME NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`id`, `profile_id`),
  INDEX `fk_cart_profile1_idx` (`profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `online shop`.`profile` (`id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`cart_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`cart_items` (
  `cart_id` INT NOT NULL,
  `cart_profile_id` INT NOT NULL,
  `shop_item_id` INT NOT NULL,
  `shop_item_product_model_id` INT NOT NULL,
  `shop_item_product_model_product_id` INT NOT NULL,
  `shop_item_shop_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`cart_id`, `cart_profile_id`, `shop_item_id`, `shop_item_product_model_id`, `shop_item_product_model_product_id`, `shop_item_shop_id`),
  INDEX `fk_cart_has_shop_item_shop_item1_idx` (`shop_item_id` ASC, `shop_item_product_model_id` ASC, `shop_item_product_model_product_id` ASC, `shop_item_shop_id` ASC) VISIBLE,
  INDEX `fk_cart_has_shop_item_cart1_idx` (`cart_id` ASC, `cart_profile_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_has_shop_item_cart1`
    FOREIGN KEY (`cart_id` , `cart_profile_id`)
    REFERENCES `online shop`.`cart` (`id` , `profile_id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_cart_has_shop_item_shop_item1`
    FOREIGN KEY (`shop_item_id` , `shop_item_product_model_id` , `shop_item_product_model_product_id` , `shop_item_shop_id`)
    REFERENCES `online shop`.`shop_item` (`id` , `product_model_id` , `product_model_product_id` , `shop_id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`supply_contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`supply_contract` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shop_id` INT NOT NULL,
  `supplier_idsupplier` INT NOT NULL,
  `since` DATETIME NULL,
  `expires` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shop_has_supplier_supplier1_idx` (`supplier_idsupplier` ASC) VISIBLE,
  INDEX `fk_shop_has_supplier_shop1_idx` (`shop_id` ASC) VISIBLE,
  CONSTRAINT `fk_shop_has_supplier_shop1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `online shop`.`shop` (`id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_shop_has_supplier_supplier1`
    FOREIGN KEY (`supplier_idsupplier`)
    REFERENCES `online shop`.`supplier` (`idsupplier`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`supplied`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`supplied` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `supply_contract_id` INT NOT NULL,
  `product_model_id` INT NOT NULL,
  `product_model_product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `price_single` INT NOT NULL,
  INDEX `fk_supply_contract_has_product_model_product_model1_idx` (`product_model_id` ASC, `product_model_product_id` ASC) VISIBLE,
  INDEX `fk_supply_contract_has_product_model_supply_contract1_idx` (`supply_contract_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_supply_contract_has_product_model_supply_contract1`
    FOREIGN KEY (`supply_contract_id`)
    REFERENCES `online shop`.`supply_contract` (`id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_supply_contract_has_product_model_product_model1`
    FOREIGN KEY (`product_model_id` , `product_model_product_id`)
    REFERENCES `online shop`.`product_model` (`id` , `product_id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`order_items` (
  `orders_id` INT NOT NULL,
  `shop_item_id` INT NOT NULL,
  `shop_item_product_model_id` INT NOT NULL,
  `shop_item_product_model_product_id` INT NOT NULL,
  `shop_item_shop_id` INT NOT NULL,
  `price_single` INT NOT NULL,
  `quantity` INT NOT NULL,
  `price_total` INT NOT NULL,
  PRIMARY KEY (`orders_id`, `shop_item_id`, `shop_item_product_model_id`, `shop_item_product_model_product_id`, `shop_item_shop_id`),
  INDEX `fk_orders_has_shop_item_shop_item1_idx` (`shop_item_id` ASC, `shop_item_product_model_id` ASC, `shop_item_product_model_product_id` ASC, `shop_item_shop_id` ASC) VISIBLE,
  INDEX `fk_orders_has_shop_item_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_has_shop_item_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `online shop`.`orders` (`id`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_orders_has_shop_item_shop_item1`
    FOREIGN KEY (`shop_item_id` , `shop_item_product_model_id` , `shop_item_product_model_product_id` , `shop_item_shop_id`)
    REFERENCES `online shop`.`shop_item` (`id` , `product_model_id` , `product_model_product_id` , `shop_id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online shop`.`price_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`price_history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shop_item_id` INT NOT NULL,
  `shop_item_product_model_id` INT NOT NULL,
  `shop_item_product_model_product_id` INT NOT NULL,
  `shop_item_shop_id` INT NOT NULL,
  `price` INT NOT NULL,
  `at_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_price_history_shop_item1_idx` (`shop_item_id` ASC, `shop_item_product_model_id` ASC, `shop_item_product_model_product_id` ASC, `shop_item_shop_id` ASC) VISIBLE,
  CONSTRAINT `fk_price_history_shop_item1`
    FOREIGN KEY (`shop_item_id` , `shop_item_product_model_id` , `shop_item_product_model_product_id` , `shop_item_shop_id`)
    REFERENCES `online shop`.`shop_item` (`id` , `product_model_id` , `product_model_product_id` , `shop_id`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;

USE `online shop` ;

-- -----------------------------------------------------
-- Placeholder table for view `online shop`.`month_total_quantity_sell`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`month_total_quantity_sell` (`month_total_quantity_sell` INT);

-- -----------------------------------------------------
-- Placeholder table for view `online shop`.`total_discount_amount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`total_discount_amount` (`total_discount_amount` INT);

-- -----------------------------------------------------
-- Placeholder table for view `online shop`.`user_wallet_transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online shop`.`user_wallet_transactions` (`amount` INT, `datetime` INT);

-- -----------------------------------------------------
-- View `online shop`.`month_total_quantity_sell`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `online shop`.`month_total_quantity_sell`;
USE `online shop`;
CREATE  OR REPLACE VIEW `month_total_quantity_sell` AS
SELECT sum(order_items.quantity) as month_total_quantity_sell FROM orders INNER JOIN order_items ON orders.id=order_items.orders_id WHERE orders.datetime >= (NOW() - INTERVAL 1 MONTH);

-- -----------------------------------------------------
-- View `online shop`.`total_discount_amount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `online shop`.`total_discount_amount`;
USE `online shop`;
CREATE  OR REPLACE VIEW `total_discount_amount` AS
SELECT sum(amount_per_code) as total_discount_amount FROM (SELECT amount*(initial_life-current_life) as amount_per_code FROM discount_code) as t;

-- -----------------------------------------------------
-- View `online shop`.`user_wallet_transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `online shop`.`user_wallet_transactions`;
USE `online shop`;
CREATE  OR REPLACE VIEW `user_wallet_transactions` AS
SELECT amount, datetime FROM wallet_transactions
INNER JOIN wallet ON wallet.id=wallet_transactions.wallet_id
INNER JOIN profile ON profile.id=wallet.customer_profile_id
WHERE profile.id=1;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
