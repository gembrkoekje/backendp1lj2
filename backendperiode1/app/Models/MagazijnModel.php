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
}
