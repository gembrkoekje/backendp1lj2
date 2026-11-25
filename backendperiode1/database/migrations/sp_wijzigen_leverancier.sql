-- Step: 01
-- Goal: Stored procedure spCountLeveranciers
--       Telt het totaal aantal leveranciers (nodig voor de pagination)
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

USE backendp1lj2;

DROP PROCEDURE IF EXISTS spCountLeveranciers;

DELIMITER $$

CREATE PROCEDURE spCountLeveranciers()
BEGIN
    SELECT   COUNT(LEVE.Id)     AS Totaal
    FROM     Leverancier AS LEVE;
END$$

DELIMITER ;


-- Step: 02
-- Goal: Stored procedure spGetLeveranciersWijzigen
--       Haalt een pagina leveranciers op voor het scherm Overzicht leveranciers
--       (server-side pagination met LIMIT en OFFSET)
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spGetLeveranciersWijzigen;

DELIMITER $$

CREATE PROCEDURE spGetLeveranciersWijzigen
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
    FROM     Leverancier AS LEVE
    ORDER BY LEVE.Id ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END$$

DELIMITER ;


-- Step: 03
-- Goal: Stored procedure spGetLeverancierDetailsById
--       Haalt de gegevens van een leverancier met de contactgegevens op
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spGetLeverancierDetailsById;

DELIMITER $$

CREATE PROCEDURE spGetLeverancierDetailsById
(
    IN p_LeverancierId INT UNSIGNED
)
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
            ,CONT.Straat
            ,CONT.Huisnummer
            ,CONT.Postcode
            ,CONT.Stad
    FROM     Leverancier AS LEVE
    INNER JOIN Contact AS CONT
            ON CONT.Id = LEVE.ContactId
    WHERE    LEVE.Id   = p_LeverancierId;
END$$

DELIMITER ;


-- Step: 04
-- Goal: Stored procedure spUpdateLeverancier
--       Wijzigt de gegevens van een leverancier en de bijbehorende contactgegevens
--       - beide tabellen worden in een transactie gewijzigd (alles of niets)
--       - een leverancier die niet actief is (IsActief = 0) kan niet gewijzigd worden
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            25-11-2026      Backend LJ2                 New
-- **********************************************************************************/

DROP PROCEDURE IF EXISTS spUpdateLeverancier;

DELIMITER $$

CREATE PROCEDURE spUpdateLeverancier
(
     IN p_LeverancierId      INT UNSIGNED
    ,IN p_Naam               VARCHAR(100)
    ,IN p_ContactPersoon     VARCHAR(100)
    ,IN p_LeverancierNummer  VARCHAR(20)
    ,IN p_Mobiel             VARCHAR(15)
    ,IN p_Straat             VARCHAR(100)
    ,IN p_Huisnummer         VARCHAR(10)
    ,IN p_Postcode           VARCHAR(7)
    ,IN p_Stad               VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF NOT EXISTS (SELECT 1 FROM Leverancier WHERE Id = p_LeverancierId AND IsActief = 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'De leverancier is niet actief en kan niet gewijzigd worden';
    END IF;

    START TRANSACTION;

    UPDATE   Leverancier
    SET      Naam              = p_Naam
            ,ContactPersoon    = p_ContactPersoon
            ,LeverancierNummer = p_LeverancierNummer
            ,Mobiel            = p_Mobiel
            ,DatumGewijzigd    = NOW(6)
    WHERE    Id                = p_LeverancierId;

    UPDATE   Contact AS CONT
    INNER JOIN Leverancier AS LEVE
            ON LEVE.ContactId    = CONT.Id
    SET      CONT.Straat         = p_Straat
            ,CONT.Huisnummer     = p_Huisnummer
            ,CONT.Postcode       = p_Postcode
            ,CONT.Stad           = p_Stad
            ,CONT.DatumGewijzigd = NOW(6)
    WHERE    LEVE.Id             = p_LeverancierId;

    COMMIT;
END$$

DELIMITER ;
