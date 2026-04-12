CREATE OR REPLACE FUNCTION generateCustomerID()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.customerID IS NULL THEN
        NEW.customerID := 'C' || LPAD(nextval('customerSeq')::TEXT, 3, '0');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER customerIDTrigger BEFORE INSERT ON customer FOR EACH ROW EXECUTE FUNCTION generateCustomerID();

CREATE OR REPLACE FUNCTION generateStaffID()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.staffID IS NULL THEN
        NEW.staffID := 'S' || LPAD(nextval('staffSeq')::TEXT, 3, '0');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER staffIDTrigger BEFORE INSERT ON staff FOR EACH ROW EXECUTE FUNCTION generateStaffID();

CREATE OR REPLACE FUNCTION generateResidentDogID()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.residentDogID IS NULL THEN
        NEW.residentDogID := 'R' || LPAD(nextval('residentDogSeq')::TEXT, 3, '0');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER residentDogIDTrigger BEFORE INSERT ON residentDog FOR EACH ROW EXECUTE FUNCTION generateResidentDogID();

CREATE OR REPLACE FUNCTION generateBookingWalkID()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.bookingWalkID IS NULL THEN
        NEW.bookingWalkID := 'B' || LPAD(nextval('bookingWalkSeq')::TEXT, 3, '0');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER bookingWalkIDTrigger BEFORE INSERT ON bookingWalk FOR EACH ROW EXECUTE FUNCTION generateBookingWalkID();

CREATE OR REPLACE FUNCTION generateMessageID()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.messageID IS NULL THEN
        NEW.messageID := 'M' || LPAD(nextval('messageSeq')::TEXT, 3, '0');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER messageIDTrigger BEFORE INSERT ON message FOR EACH ROW EXECUTE FUNCTION generateMessageID();
