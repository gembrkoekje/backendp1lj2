<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use PDO;
use PDOException;

class LeverancierModel
{
    private PDO $pdo;

    /**
     * Zonder PDO-object wordt de standaard databaseverbinding gebruikt.
     * Voor de unit-tests kan een mock van PDO worden meegegeven.
     */
    public function __construct(?PDO $pdo = null)
    {
        $this->pdo = $pdo ?? DB::connection()->getPdo();
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

    /**
     * Haalt het product met de gegevens van de leverancier op voor het scherm Levering product.
     */
    public function getProductVanLeverancier(int $leverancierId, int $productId): object|false
    {
        $statement = $this->pdo->prepare('CALL spGetProductVanLeverancier(:leverancierId, :productId)');
        $statement->bindValue(':leverancierId', $leverancierId, PDO::PARAM_INT);
        $statement->bindValue(':productId', $productId, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetch(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }

    /**
     * Voegt een nieuwe levering toe en verhoogt het aantal van het product in het magazijn.
     */
    public function createLevering(int $leverancierId, int $productId, int $aantal, string $datumEerstVolgendeLevering): void
    {
        $statement = $this->pdo->prepare('CALL spCreateLevering(:leverancierId, :productId, :aantal, :datumEerstVolgendeLevering)');
        $statement->bindValue(':leverancierId', $leverancierId, PDO::PARAM_INT);
        $statement->bindValue(':productId', $productId, PDO::PARAM_INT);
        $statement->bindValue(':aantal', $aantal, PDO::PARAM_INT);
        $statement->bindValue(':datumEerstVolgendeLevering', $datumEerstVolgendeLevering, PDO::PARAM_STR);
        $statement->execute();
        $statement->closeCursor();
    }

    /**
     * Telt het totaal aantal leveranciers.
     */
    public function getAantalLeveranciers(): int
    {
        $statement = $this->pdo->prepare('CALL spCountLeveranciers()');
        $statement->execute();

        $result = $statement->fetch(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return (int) $result->Totaal;
    }

    /**
     * Haalt één pagina leveranciers op voor het scherm Overzicht leveranciers (wijzigen).
     */
    public function getLeveranciersWijzigen(int $limit, int $offset): array
    {
        $statement = $this->pdo->prepare('CALL spGetLeveranciersWijzigen(:limit, :offset)');
        $statement->bindValue(':limit', $limit, PDO::PARAM_INT);
        $statement->bindValue(':offset', $offset, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetchAll(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }

    /**
     * Haalt de gegevens van één leverancier met de contactgegevens op.
     */
    public function getLeverancierDetailsById(int $leverancierId): object|false
    {
        $statement = $this->pdo->prepare('CALL spGetLeverancierDetailsById(:leverancierId)');
        $statement->bindValue(':leverancierId', $leverancierId, PDO::PARAM_INT);
        $statement->execute();

        $result = $statement->fetch(PDO::FETCH_OBJ);
        $statement->closeCursor();

        return $result;
    }

    /**
     * Wijzigt de gegevens van een leverancier en de bijbehorende contactgegevens.
     * Geeft true terug als de wijziging is doorgevoerd en false bij een databasefout.
     *
     * @param  array<string, string>  $gegevens
     */
    public function updateLeverancier(int $leverancierId, array $gegevens): bool
    {
        try {
            $statement = $this->pdo->prepare('CALL spUpdateLeverancier(:leverancierId, :naam, :contactPersoon, :leverancierNummer, :mobiel, :straat, :huisnummer, :postcode, :stad)');
            $statement->bindValue(':leverancierId', $leverancierId, PDO::PARAM_INT);
            $statement->bindValue(':naam', $gegevens['naam'], PDO::PARAM_STR);
            $statement->bindValue(':contactPersoon', $gegevens['contactpersoon'], PDO::PARAM_STR);
            $statement->bindValue(':leverancierNummer', $gegevens['leveranciernummer'], PDO::PARAM_STR);
            $statement->bindValue(':mobiel', $gegevens['mobiel'], PDO::PARAM_STR);
            $statement->bindValue(':straat', $gegevens['straatnaam'], PDO::PARAM_STR);
            $statement->bindValue(':huisnummer', $gegevens['huisnummer'], PDO::PARAM_STR);
            $statement->bindValue(':postcode', $gegevens['postcode'], PDO::PARAM_STR);
            $statement->bindValue(':stad', $gegevens['stad'], PDO::PARAM_STR);
            $statement->execute();
            $statement->closeCursor();

            return true;
        } catch (PDOException $exception) {
            Log::error('Leverancier '.$leverancierId.' kon niet gewijzigd worden: '.$exception->getMessage());

            return false;
        }
    }
}
