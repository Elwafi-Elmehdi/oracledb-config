CREATE TRIGGER client_view_trigger
INSTEAD OF INSERT ON client
FOR EACH ROW
BEGIN
IF :NEW.ville='Casablanca' THEN INSERT INTO client_1@ENSIAS1 VALUES (:NEW.no,:NEW.NOM,:NEW.prenom,:NEW.adresse);
END IF;
IF :NEW.ville='Rabat' THEN INSERT INTO client_2@ENSIAS2 VALUES (:NEW.no,:NEW.NOM,:NEW.prenom,:NEW.adresse);
END IF;
END; 