CREATE OR REPLACE TRIGGER Maj_Image_Appreil
AFTER INSERT OR UPDATE OR DELETE ON Appareil
FOR EACH ROW
BEGIN
IF INSERTING THEN

INSERT INTO Image_Appareil@BDL_ENSIAS_1 VALUES(:NEW.no_appareil,:NEW.designation,:NEW.prix,:NEW.caracteristiques_techniques);

ELSIF DELETING THEN

DELETE FROM Image_Appareil@BDL_ENSIAS_1 WHERE no_appareil=:OLD. no_appareil;

ELSIF UPDATING THEN

UPDATE Image_Appareil@BDL_ENSIAS_1 
SET 
no_appareil = :NEW.no_appareil,
designation = :NEW.designation,
prix = :NEW.prix,
caracteristiques_techniques =:NEW.caracteristiques_techniques
WHERE no_appareil = :OLD.no_appareil;

END IF;
END;
/