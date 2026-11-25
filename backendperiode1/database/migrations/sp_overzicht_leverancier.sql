-- Step: 01
-- Goal: Stored procedure spGetAllLeveranciers
--       Overzicht van alle leveranciers met het aantal verschillende producten
--       dat zij aan Jamin leveren, gesorteerd op Aantal verschillende producten aflopend
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            01-11-2026      Backend LJ2                 New
-- 02            25-11-2026      Backend LJ2                 Pagination (LIMIT en OFFSET), ook niet-actieve leveranciers
-- **********************************************************************************/

USE backendp1lj2;

DROP PROCEDURE IF EXISTS spGetAllLeveranciers;

DELIMITER $$

CREATE PROCEDURE spGetAllLeveranciers
(
     IN p_Limit   INT UNSIGNED
    ,IN p_Offset  INT UNSIGNED
)
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
            ,COUNT(DISTINCT PPLE.ProductId)     AS AantalVerschillendeProducten
    FROM     Leverancier AS LEVE
    LEFT JOIN ProductPerLeverancier AS PPLE
           ON PPLE.LeverancierId = LEVE.Id
    GROUP BY LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
    ORDER BY AantalVerschillendeProducten DESC
            ,LEVE.Naam ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END$$

DELIMITER ;


-- Step: 02
-- Goal: Stored procedure spGetLeverancierById
--       Haalt de gegevens van een leverancier op
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            01-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spGetLeverancierById;

DELIMITER $$

CREATE PROCEDURE spGetLeverancierById
(
    IN p_LeverancierId INT UNSIGNED
)
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
    FROM     Leverancier AS LEVE
    WHERE    LEVE.Id = p_LeverancierId;
END$$

DELIMITER ;


-- Step: 03
-- Goal: Stored procedure spGetGeleverdeProductenByLeverancierId
--       Haalt de verschillende producten op die een leverancier aan Jamin levert,
--       met het aantal in het magazijn en de datum van de laatste levering,
--       gesorteerd op Aantal in magazijn aflopend
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            01-11-2026      Backend LJ2                 New
-- 02            25-11-2026      Backend LJ2                 Pagination (LIMIT en OFFSET)
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spGetGeleverdeProductenByLeverancierId;

DELIMITER $$

CREATE PROCEDURE spGetGeleverdeProductenByLeverancierId
(
     IN p_LeverancierId  INT UNSIGNED
    ,IN p_Limit          INT UNSIGNED
    ,IN p_Offset         INT UNSIGNED
)
BEGIN
    SELECT   PROD.Id                    AS ProductId
            ,PROD.Naam
            ,MAGA.AantalAanwezig
            ,MAGA.VerpakkingsEenheid
            ,MAX(PPLE.DatumLevering)    AS LaatsteLevering
    FROM     ProductPerLeverancier AS PPLE
    INNER JOIN Product AS PROD
            ON PROD.Id = PPLE.ProductId
    LEFT JOIN Magazijn AS MAGA
            ON MAGA.ProductId = PROD.Id
    WHERE    PPLE.LeverancierId = p_LeverancierId
    GROUP BY PROD.Id
            ,PROD.Naam
            ,MAGA.AantalAanwezig
            ,MAGA.VerpakkingsEenheid
    ORDER BY MAGA.AantalAanwezig DESC
            ,PROD.Naam ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END$$

DELIMITER ;
