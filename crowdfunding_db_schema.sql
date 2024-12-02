CREATE TABLE category (
    category_id VARCHAR(25) PRIMARY KEY,
    category VARCHAR(25) NOT NULL
);

CREATE TABLE subcategory (
    subcategory_id VARCHAR(25) PRIMARY KEY, 
    subcategory VARCHAR(25) NOT NULL
);

CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE 
);

CREATE TABLE campaign (
    cf_id SERIAL PRIMARY KEY,
    contact_id INTEGER NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    description TEXT,
    goal DECIMAL(10, 2) NOT NULL,
    pledged DECIMAL(10, 2) NOT NULL,
    outcome VARCHAR(25),
    backers_count INTEGER DEFAULT 0,
    country VARCHAR(5),
    currency VARCHAR(5),
    launch_date TIMESTAMP NOT NULL, 
    end_date TIMESTAMP NOT NULL,   
    category_id VARCHAR(25),      
    subcategory_id VARCHAR(25), 

    -- Define Foreign Key relationships
    CONSTRAINT fk_contact FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id),
    CONSTRAINT fk_subcategory FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

-- Verify category table
SELECT * FROM category;

-- Verify subcategory table
SELECT * FROM subcategory;

-- Verify contacts table
SELECT * FROM contacts;

-- Verify campaign table
SELECT * FROM campaign;


