CREATE DATABASE IF NOT EXISTS estrellas;
USE estrellas;
DROP PROCEDURE IF EXISTS  rellenar;
DELIMITER $$
CREATE PROCEDURE rellenar()
BEGIN
	DECLARE x  INT;
    DECLARE NUM_ESPACIOS  INT;
    DECLARE NUMERO  INT;
	DROP TEMPORARY TABLE IF EXISTS  stars;
    CREATE TEMPORARY TABLE stars (
	  lista CHAR(255)
	);
	SET NUMERO = 15;
	SET NUM_ESPACIOS = ((numero+1)/2)-1;
	SET @MITAD = false;
    SET x = 0;	
	loop_rellenar:  LOOP
		IF  x > NUMERO THEN 
				LEAVE  loop_rellenar;
        END  IF;
        
        SET @x_espacios=0;
		SET @x_estrellas=0;
        SET @espacios='';
        SET @estrellas='';

        loop_espacio: LOOP
			IF  @x_espacios >= NUM_ESPACIOS THEN 
					LEAVE  loop_espacio;
			END  IF;
			
			SET @espacios=CONCAT(@espacios,'  ');
			
			SET   @x_espacios =  @x_espacios + 1;
			IF   @x_espacios < NUM_ESPACIOS  THEN 
				ITERATE  loop_espacio;
			ELSE
				LEAVE  loop_espacio;
			END  IF;
        END LOOP;
        
        loop_estrella: LOOP
			IF  @x_estrellas >= NUMERO-(NUM_ESPACIOS*2) THEN 
					LEAVE  loop_estrella;
			END  IF;
            SET @estrellas=CONCAT(@estrellas,'*');
			
			SET   @x_estrellas =  @x_estrellas + 1;
			IF   @x_estrellas < NUMERO-(NUM_ESPACIOS*2)  THEN 
				ITERATE  loop_estrella;
			ELSE
				LEAVE  loop_estrella;
			END  IF;
        END LOOP;
        
		SET @contenido = CONCAT(@espacios,@estrellas);
        INSERT INTO stars(lista)  VALUES (@contenido);
        IF NUM_ESPACIOS <=>	 0 AND LENGTH(@estrellas) <=> NUMERO THEN
            SET @MITAD= true;
	
		END IF;
        
        IF NOT @MITAD THEN
            SET NUM_ESPACIOS = NUM_ESPACIOS - 1;
        ELSE
            SET NUM_ESPACIOS = NUM_ESPACIOS + 1;
		END IF;
		
        
		SET  x = x + 1;
		IF  x < NUMERO  THEN 
			ITERATE  loop_rellenar;
		ELSE
            LEAVE  loop_rellenar;
		END  IF;
			
	END LOOP;
	SELECT * FROM stars ;
END$$
DELIMITER ;
CALL rellenar();
DROP DATABASE estrellas;