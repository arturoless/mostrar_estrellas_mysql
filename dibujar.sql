CREATE DATABASE IF NOT EXISTS estrellas;
USE estrellas;
DROP PROCEDURE IF EXISTS dibujar;
DELIMITER $$
CREATE PROCEDURE dibujar()
BEGIN
	DECLARE x  INT;
    DECLARE NUM_ESPACIOS  INT;
    DECLARE NUMERO  INT;
	DROP TEMPORARY TABLE IF EXISTS stars;
    CREATE TEMPORARY TABLE stars (
	  lista CHAR(255)
	);
	SET NUMERO = 15;
	SET NUM_ESPACIOS = ((numero+1)/2)-1;
	SET @MITAD = false;
    SET x = 0;

	
	loop_dibujar:  LOOP
		IF  x > NUMERO THEN 
				LEAVE  loop_dibujar;
        END  IF;
        
        SET @x_espacios=0;
		SET @x_estrellas=0;
        SET @espacios='';
        SET @estrellas='';
        
        loop_espacio: LOOP
			IF  @x_espacios >= NUM_ESPACIOS THEN 
					LEAVE  loop_espacio;
			END  IF;
			
			SET @espacios=CONCAT('  ',@espacios);
			
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
            IF @x_estrellas <=> 0 OR @x_estrellas <=> (NUMERO-(NUM_ESPACIOS*2)-1)  THEN
                SET @estrellas=CONCAT(@estrellas,'*');
            ELSE
                SET @estrellas=CONCAT(@estrellas,'  ');
			END IF;
			
			SET   @x_estrellas =  @x_estrellas + 1;
			IF   @x_estrellas < NUMERO-(NUM_ESPACIOS*2)  THEN 
				ITERATE  loop_estrella;
			ELSE
				LEAVE  loop_estrella;
			END  IF;
        END LOOP;
        SET @contenido = CONCAT(@espacios,@estrellas);
		INSERT INTO stars(lista)  VALUES (@contenido);
        
		IF NUM_ESPACIOS <=>	 0 THEN
            SET @MITAD= true;
        END IF;
        
        IF NOT @MITAD THEN
            SET NUM_ESPACIOS = NUM_ESPACIOS - 1;
        ELSE
            SET NUM_ESPACIOS = NUM_ESPACIOS + 1;
		END IF;
		
        
		SET  x = x + 1;
		IF  x < NUMERO  THEN 
			ITERATE  loop_dibujar;
		ELSE
            LEAVE  loop_dibujar;
		END  IF;
        
			
	END LOOP;
	SELECT * FROM stars ;
END$$
 
DELIMITER ;
CALL dibujar();
DROP DATABASE estrellas;