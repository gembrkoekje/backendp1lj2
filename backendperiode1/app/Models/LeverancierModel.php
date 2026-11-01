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

    /**
     * Haalt de gegevens van één leverancier op.
     */
    public function getLeverancierById(int $leverancierId): object|false
    {
        $statement = $this->pdo->prepare('CALL spGetLeverancierById(:leverancierId)');
        $statement->bindValue(':leverancierId', $leverancierId, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetch(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }

    /**
     * Haalt de verschillende producten op die de leverancier aan Jamin levert,
     * gesorteerd op Aantal in magazijn aflopend.
     */
    public function getGeleverdeProductenByLeverancierId(int $leverancierId): array
    {
        $statement = $this->pdo->prepare('CALL spGetGeleverdeProductenByLeverancierId(:leverancierId)');
        $statement->bindValue(':leverancierId', $leverancierId, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetchAll(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }
}
