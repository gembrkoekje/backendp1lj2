-- Step: 01
-- Goal: Stored procedure spGetProductVanLeverancier
--       Haalt het product en de leveranciergegevens op voor het scherm Levering product
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            01-11-2026      Backend LJ2                 New
-- **********************************************************************************/

USE backendp1lj2;

DROP PROCEDURE IF EXISTS spGetProductVanLeverancier;

DELIMITER $$

CREATE PROCEDURE spGetProductVanLeverancier
(
     IN p_LeverancierId INT UNSIGNED
    ,IN p_ProductId     INT UNSIGNED
)
BEGIN
    SELECT   PROD.Id                AS ProductId
            ,PROD.Naam              AS ProductNaam
            ,PROD.IsActief + 0      AS ProductIsActief
            ,LEVE.Id                AS LeverancierId
            ,LEVE.Naam              AS LeverancierNaam
            ,LEVE.ContactPersoon
            ,LEVE.Mobiel
    FROM     Leverancier AS LEVE
    INNER JOIN ProductPerLeverancier AS PPLE
            ON PPLE.LeverancierId = LEVE.Id
    INNER JOIN Product AS PROD
            ON PROD.Id = PPLE.ProductId
    WHERE    LEVE.Id   = p_LeverancierId
      AND    PROD.Id   = p_ProductId
    LIMIT    1;
END$$

DELIMITER ;


-- Step: 02
-- Goal: Stored procedure spCreateLevering
--       Voegt een nieuwe zending van een product toe:
--       - nieuwe regel in ProductPerLeverancier (DatumLevering = vandaag)
--       - Aantal wordt opgeteld bij AantalAanwezig in het Magazijn
--       Een product dat niet meer actief is (IsActief = 0) kan niet geleverd worden
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            01-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spCreateLevering;

DELIMITER $$

CREATE PROCEDURE spCreateLevering
(
     IN p_LeverancierId                 INT UNSIGNED
    ,IN p_ProductId                     INT UNSIGNED
    ,IN p_Aantal                        INT UNSIGNED
    ,IN p_DatumEerstVolgendeLevering    DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF NOT EXISTS (SELECT 1 FROM Product WHERE Id = p_ProductId AND IsActief = 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Het product wordt niet meer geproduceerd';
    END IF;

    START TRANSACTION;

    INSERT INTO ProductPerLeverancier
    (
         LeverancierId
        ,ProductId
        ,DatumLevering
        ,Aantal
        ,DatumEerstVolgendeLevering
        ,IsActief
        ,Opmerking
        ,DatumAangemaakt
        ,DatumGewijzigd
    )
    VALUES
    (
         p_LeverancierId
        ,p_ProductId
        ,CURDATE()
        ,p_Aantal
        ,p_DatumEerstVolgendeLevering
        ,1
        ,NULL
        ,NOW(6)
        ,NOW(6)
    );

    UPDATE   Magazijn
    SET      AantalAanwezig = IFNULL(AantalAanwezig, 0) + p_Aantal
            ,DatumGewijzigd = NOW(6)
    WHERE    ProductId      = p_ProductId;

    COMMIT;
END$$

DELIMITER ;
