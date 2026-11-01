<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use PDO;

class LeverancierModel
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = DB::connection()->getPdo();
    }

    /**
     * Haalt alle leveranciers op met het aantal verschillende producten dat zij leveren,
     * gesorteerd op Aantal verschillende producten aflopend.
     */
    public function getAllLeveranciers(): array
    {
        $statement = $this->pdo->prepare('CALL spGetAllLeveranciers()');
        $statement->execute();

        $result = $statement->fetchAll(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }
}
