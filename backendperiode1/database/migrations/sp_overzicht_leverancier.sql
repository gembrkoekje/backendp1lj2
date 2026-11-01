-- Step: 01
-- Goal: Stored procedure spGetAllLeveranciers
--       Overzicht van alle leveranciers met het aantal verschillende producten
--       dat zij aan Jamin leveren, gesorteerd op Aantal verschillende producten aflopend
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            01-11-2026      Backend LJ2                 New
-- **********************************************************************************/

USE backendp1lj2;

DROP PROCEDURE IF EXISTS spGetAllLeveranciers;

DELIMITER $$

CREATE PROCEDURE spGetAllLeveranciers()
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
    WHERE    LEVE.IsActief = 1
    GROUP BY LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
    ORDER BY AantalVerschillendeProducten DESC
            ,LEVE.Naam ASC;
END$$

DELIMITER ;
