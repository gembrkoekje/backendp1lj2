<?php

namespace Tests\Unit;

use App\Models\LeverancierModel;
use PDO;
use PDOException;
use PDOStatement;
use Tests\TestCase;

class LeverancierModelTest extends TestCase
{
    /**
     * De gegevens die in het formulier Wijzig Leveranciergegevens worden ingevuld.
     *
     * @var array<string, string>
     */
    private array $gegevens = [
        'naam' => 'Astra Sweets',
        'contactpersoon' => 'Jasper del Monte',
        'leveranciernummer' => 'L1029284315',
        'mobiel' => '06-39398825',
        'straatnaam' => 'Den Dolderlaan',
        'huisnummer' => '2',
        'postcode' => '1067RC',
        'stad' => 'Utrecht',
    ];

    /**
     * Unit-test 1 (scenario_01): updateLeverancier roept de stored procedure aan
     * met de ingevulde gegevens en geeft true terug als de wijziging is doorgevoerd.
     */
    public function test_update_leverancier_geeft_true_als_de_wijziging_is_doorgevoerd(): void
    {
        $gebonden = [];

        $statement = $this->createMock(PDOStatement::class);
        $statement->method('bindValue')->willReturnCallback(
            function (string $parameter, mixed $waarde) use (&$gebonden): bool {
                $gebonden[$parameter] = $waarde;

                return true;
            }
        );
        $statement->expects($this->once())->method('execute')->willReturn(true);

        $pdo = $this->createMock(PDO::class);
        $pdo->expects($this->once())
            ->method('prepare')
            ->with($this->stringContains('CALL spUpdateLeverancier('))
            ->willReturn($statement);

        $resultaat = (new LeverancierModel($pdo))->updateLeverancier(2, $this->gegevens);

        $this->assertTrue($resultaat);
        $this->assertSame([
            ':leverancierId' => 2,
            ':naam' => 'Astra Sweets',
            ':contactPersoon' => 'Jasper del Monte',
            ':leverancierNummer' => 'L1029284315',
            ':mobiel' => '06-39398825',
            ':straat' => 'Den Dolderlaan',
            ':huisnummer' => '2',
            ':postcode' => '1067RC',
            ':stad' => 'Utrecht',
        ], $gebonden);
    }

    /**
     * Unit-test 2 (scenario_02): updateLeverancier geeft false terug als de database
     * een fout geeft, zodat de melding van de technische storing getoond kan worden.
     */
    public function test_update_leverancier_geeft_false_bij_een_databasefout(): void
    {
        $statement = $this->createStub(PDOStatement::class);
        $statement->method('execute')->willThrowException(
            new PDOException('De leverancier is niet actief en kan niet gewijzigd worden')
        );

        $pdo = $this->createStub(PDO::class);
        $pdo->method('prepare')->willReturn($statement);

        $resultaat = (new LeverancierModel($pdo))->updateLeverancier(5, $this->gegevens);

        $this->assertFalse($resultaat);
    }
}
