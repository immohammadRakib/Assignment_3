CREATE DATABASE "Football Ticket Booking System";

CREATE TABLE Users (
    user_id SERIAL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    
    -- Constraints
    CONSTRAINT pk_users PRIMARY KEY (user_id),
    CONSTRAINT uk_users_email UNIQUE (email),
    CONSTRAINT chk_users_role CHECK (role IN ('Ticket Manager', 'Football Fan'))
);

CREATE TABLE Matches (
    match_id SERIAL,
    fixture VARCHAR(150) NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price DECIMAL(10, 2) NOT NULL,
    match_status VARCHAR(50) NOT NULL,
    
    -- Constraints
    CONSTRAINT pk_matches PRIMARY KEY (match_id),
    CONSTRAINT chk_matches_price CHECK (base_ticket_price >= 0),
    CONSTRAINT chk_matches_status CHECK (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);

CREATE TABLE Bookings (
    booking_id SERIAL,
    user_id INT NOT NULL,
    match_id INT NOT NULL,
    seat_number VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost DECIMAL(10, 2) NOT NULL,
    
    -- Constraints
    CONSTRAINT pk_bookings PRIMARY KEY (booking_id),
    CONSTRAINT fk_bookings_user FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_bookings_match FOREIGN KEY (match_id) REFERENCES Matches(match_id) ON DELETE CASCADE,
    CONSTRAINT chk_bookings_cost CHECK (total_cost >= 0),
    CONSTRAINT chk_bookings_status CHECK (payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded') OR payment_status IS NULL)
);