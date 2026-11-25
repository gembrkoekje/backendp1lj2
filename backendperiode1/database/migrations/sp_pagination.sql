-- Step: 01
-- Goal: Stored procedure spCountMagazijn
--       Telt het totaal aantal producten in het magazijn
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

USE backendp1lj2;

DROP PROCEDURE IF EXISTS spCountMagazijn;

DELIMITER $$

CREATE PROCEDURE spCountMagazijn()
BEGIN
    SELECT   COUNT(MAGA.Id)     AS Totaal
    FROM     Magazijn AS MAGA;
END$$

DELIMITER ;


-- Step: 02
-- Goal: Stored procedure spGetMagazijnOverzicht
--       Haalt een pagina producten in het magazijn op, gesorteerd op barcode oplopend
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spGetMagazijnOverzicht;

DELIMITER $$

CREATE PROCEDURE spGetMagazijnOverzicht
(
     IN p_Limit   INT UNSIGNED
    ,IN p_Offset  INT UNSIGNED
)
BEGIN
    SELECT   PROD.Id
            ,PROD.Naam
            ,PROD.Barcode
            ,MAGA.VerpakkingsEenheid
            ,MAGA.AantalAanwezig
    FROM     Magazijn AS MAGA
    INNER JOIN Product AS PROD
            ON PROD.Id = MAGA.ProductId
    ORDER BY PROD.Barcode ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END$$

DELIMITER ;


-- Step: 03
-- Goal: Stored procedure spCountLeveringenByProductId
--       Telt het totaal aantal leveringen van een product
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spCountLeveringenByProductId;

DELIMITER $$

CREATE PROCEDURE spCountLeveringenByProductId
(
    IN p_ProductId INT UNSIGNED
)
BEGIN
    SELECT   COUNT(PPLE.Id)     AS Totaal
    FROM     ProductPerLeverancier AS PPLE
    WHERE    PPLE.ProductId = p_ProductId;
END$$

DELIMITER ;


-- Step: 04
-- Goal: Stored procedure spGetLeveringenByProductId
--       Haalt een pagina leveringen van een product op,
--       gesorteerd op datum laatste levering oplopend
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spGetLeveringenByProductId;

DELIMITER $$

CREATE PROCEDURE spGetLeveringenByProductId
(
     IN p_ProductId  INT UNSIGNED
    ,IN p_Limit      INT UNSIGNED
    ,IN p_Offset     INT UNSIGNED
)
BEGIN
    SELECT   PROD.Naam
            ,PPLE.DatumLevering
            ,PPLE.Aantal
            ,PPLE.DatumEerstVolgendeLevering
    FROM     ProductPerLeverancier AS PPLE
    INNER JOIN Product AS PROD
            ON PROD.Id = PPLE.ProductId
    WHERE    PPLE.ProductId = p_ProductId
    ORDER BY PPLE.DatumLevering ASC
            ,PPLE.Id ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END$$

DELIMITER ;


-- Step: 05
-- Goal: Stored procedure spCountAllergenenByProductId
--       Telt het totaal aantal allergenen van een product
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spCountAllergenenByProductId;

DELIMITER $$

CREATE PROCEDURE spCountAllergenenByProductId
(
    IN p_ProductId INT UNSIGNED
)
BEGIN
    SELECT   COUNT(PPAL.Id)     AS Totaal
    FROM     ProductPerAllergeen AS PPAL
    WHERE    PPAL.ProductId = p_ProductId;
END$$

DELIMITER ;


-- Step: 06
-- Goal: Stored procedure spGetAllergenenByProductId
--       Haalt een pagina allergenen van een product op, gesorteerd op naam oplopend
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spGetAllergenenByProductId;

DELIMITER $$

CREATE PROCEDURE spGetAllergenenByProductId
(
     IN p_ProductId  INT UNSIGNED
    ,IN p_Limit      INT UNSIGNED
    ,IN p_Offset     INT UNSIGNED
)
BEGIN
    SELECT   ALLE.Naam
            ,ALLE.Omschrijving
    FROM     ProductPerAllergeen AS PPAL
    INNER JOIN Allergeen AS ALLE
            ON ALLE.Id = PPAL.AllergeenId
    WHERE    PPAL.ProductId = p_ProductId
    ORDER BY ALLE.Naam ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END$$

DELIMITER ;


-- Step: 07
-- Goal: Stored procedure spCountGeleverdeProductenByLeverancierId
--       Telt het aantal verschillende producten dat een leverancier levert
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spCountGeleverdeProductenByLeverancierId;

DELIMITER $$

CREATE PROCEDURE spCountGeleverdeProductenByLeverancierId
(
    IN p_LeverancierId INT UNSIGNED
)
BEGIN
    SELECT   COUNT(DISTINCT PPLE.ProductId)     AS Totaal
    FROM     ProductPerLeverancier AS PPLE
    WHERE    PPLE.LeverancierId = p_LeverancierId;
END$$

DELIMITER ;
