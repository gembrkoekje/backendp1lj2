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
     * Haalt alle producten in het magazijn op, gesorteerd op barcode oplopend.
     */
    public function getMagazijnOverzicht(): array
    {
        $sql = "SELECT  PROD.Id
                       ,PROD.Naam
                       ,PROD.Barcode
                       ,MAGA.VerpakkingsEenheid
                       ,MAGA.AantalAanwezig
                FROM    Magazijn AS MAGA
                INNER JOIN Product AS PROD
                        ON PROD.Id = MAGA.ProductId
                ORDER BY PROD.Barcode ASC";

        $statement = $this->pdo->prepare($sql);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_OBJ);
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
}
