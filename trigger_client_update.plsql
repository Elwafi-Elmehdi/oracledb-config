CREATE OR REPLACE TRIGGER client_update_trigger
INSTEAD OF UPDATE ON client
FOR EACH ROW
BEGIN
IF :OLD.ville='Casablanca' THEN 
UPDATE client_1@ENSIAS1 
SET  no=:NEW.no,nom=:NEW.NOM,prenom=:NEW.prenom,adresse=:NEW.adresse) WHERE no = :OLD.no;
ELSIF :NEW.ville='Rabat' THEN
UPDATE client_2@ENSIAS2 
SET  no=:NEW.no,nom=:NEW.NOM,prenom=:NEW.prenom,adresse=:NEW.adresse WHERE no = :OLD.no;

END IF;
END;
/`