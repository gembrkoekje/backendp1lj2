<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use PDO;

class MagazijnModel
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = DB::connection()->getPdo();
    }

    /**
     * Telt het totaal aantal producten in het magazijn.
     */
    public function getAantalMagazijn(): int
    {
        $statement = $this->pdo->prepare('CALL spCountMagazijn()');
        $statement->execute();

        $result = $statement->fetch(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return (int) $result->Totaal;
    }

    /**
     * Haalt één pagina producten in het magazijn op, gesorteerd op barcode oplopend.
     */
    public function getMagazijnOverzicht(int $limit, int $offset): array
    {
        $statement = $this->pdo->prepare('CALL spGetMagazijnOverzicht(:limit, :offset)');
        $statement->bindValue(':limit', $limit, PDO::PARAM_INT);
        $statement->bindValue(':offset', $offset, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetchAll(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }

    /**
     * Haalt de magazijngegevens op van het gekozen product.
     */
    public function getMagazijnByProductId(int $productId): object|false
    {
        $sql = "SELECT  PROD.Id
                       ,PROD.Naam
                       ,PROD.Barcode
                       ,MAGA.VerpakkingsEenheid
                       ,MAGA.AantalAanwezig
                FROM    Magazijn AS MAGA
                INNER JOIN Product AS PROD
                        ON PROD.Id = MAGA.ProductId
                WHERE   MAGA.ProductId = :productId";

        $statement = $this->pdo->prepare($sql);
        $statement->bindValue(':productId', $productId, PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch(PDO::FETCH_OBJ);
    }

    /**
     * Haalt de leveranciergegevens op van het gekozen product.
     */
    public function getLeverancierByProductId(int $productId): object|false
    {
        $sql = "SELECT DISTINCT
                        LEVE.Naam
                       ,LEVE.ContactPersoon
                       ,LEVE.LeverancierNummer
                       ,LEVE.Mobiel
                FROM    ProductPerLeverancier AS PPLE
                INNER JOIN Leverancier AS LEVE
                        ON LEVE.Id = PPLE.LeverancierId
                WHERE   PPLE.ProductId = :productId
                LIMIT   1";

        $statement = $this->pdo->prepare($sql);
        $statement->bindValue(':productId', $productId, PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch(PDO::FETCH_OBJ);
    }

    /**
     * Telt het totaal aantal leveringen van het gekozen product.
     */
    public function getAantalLeveringen(int $productId): int
    {
        $statement = $this->pdo->prepare('CALL spCountLeveringenByProductId(:productId)');
        $statement->bindValue(':productId', $productId, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetch(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return (int) $result->Totaal;
    }

    /**
     * Haalt één pagina leveringen van het gekozen product op, gesorteerd op datum laatste levering oplopend.
     */
    public function getLeveringenByProductId(int $productId, int $limit, int $offset): array
    {
        $statement = $this->pdo->prepare('CALL spGetLeveringenByProductId(:productId, :limit, :offset)');
        $statement->bindValue(':productId', $productId, PDO::PARAM_INT);
        $statement->bindValue(':limit', $limit, PDO::PARAM_INT);
        $statement->bindValue(':offset', $offset, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetchAll(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }

    /**
     * Telt het totaal aantal allergenen van het gekozen product.
     */
    public function getAantalAllergenen(int $productId): int
    {
        $statement = $this->pdo->prepare('CALL spCountAllergenenByProductId(:productId)');
        $statement->bindValue(':productId', $productId, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetch(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return (int) $result->Totaal;
    }

    /**
     * Haalt één pagina allergenen van het gekozen product op, gesorteerd op naam oplopend.
     */
    public function getAllergenenByProductId(int $productId, int $limit, int $offset): array
    {
        $statement = $this->pdo->prepare('CALL spGetAllergenenByProductId(:productId, :limit, :offset)');
        $statement->bindValue(':productId', $productId, PDO::PARAM_INT);
        $statement->bindValue(':limit', $limit, PDO::PARAM_INT);
        $statement->bindValue(':offset', $offset, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetchAll(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }
}
