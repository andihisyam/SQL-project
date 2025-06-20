CREATE TABLE Part_Category (
    part_cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE Inventories (
    inventory_id INT PRIMARY KEY,
    version VARCHAR(100) NOT NULL,
    set_num VARCHAR(100) NOT NULL
);
CREATE TABLE Parts (
    part_num VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    part_cat_id INT,
    FOREIGN KEY (part_cat_id) REFERENCES Part_Category(part_cat_id)
);
CREATE TABLE colors_1 (
    color_id INT PRIMARY KEY,
    alias VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    rgb VARCHAR(6) NOT NULL,
    is_trans CHAR(1) NOT NULL,
    INDEX idx_alias (alias)  
);
CREATE TABLE colors_2 (
    alias VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (alias) REFERENCES colors_1 (alias)
);

CREATE TABLE Themes (
    theme_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES Themes(theme_id)
);

CREATE TABLE Sets (
    set_num VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year INT,
    theme_id INT,
    num_parts INT,
    FOREIGN KEY (theme_id) REFERENCES Themes(theme_id)
);

CREATE TABLE Inventory_Sets (
    inventory_id INT,
    set_num VARCHAR(50),
    quantity INT,
    PRIMARY KEY (inventory_id, set_num),
    FOREIGN KEY (inventory_id) REFERENCES Inventories(inventory_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventory_Part(inventory_id),
    FOREIGN KEY (set_num) REFERENCES Sets(set_num)
);

CREATE TABLE Inventory_Part (
    inventory_id INT,
    part_num VARCHAR(255),
    color_id INT,
    quantity INT,
    is_spare CHAR(1) NOT NULL,
    PRIMARY KEY (inventory_id, part_num, color_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventory_Sets(inventory_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventories(inventory_id),
    FOREIGN KEY (part_num) REFERENCES Parts(part_num),
    FOREIGN KEY (color_id) REFERENCES colors_1(color_id)
);
