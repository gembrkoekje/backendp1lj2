<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Maakt de stored procedures voor de pagination op de overzichtspagina's aan.
     */
    public function up(): void
    {
        $sql = file_get_contents(database_path('migrations/sp_pagination.sql'));

        // DELIMITER en USE zijn client-commando's (MySQL Workbench), die halen we eruit
        $sql = preg_replace('/^\s*(DELIMITER|USE)\b.*$/mi', '', $sql);

        foreach (explode('$$', $sql) as $statement) {
            if (trim(preg_replace('/^\s*--.*$/m', '', $statement)) !== '') {
                DB::unprepared($statement);
            }
        }
    }

    /**
     * Verwijdert de stored procedures weer.
     */
    public function down(): void
    {
        DB::unprepared('DROP PROCEDURE IF EXISTS spCountMagazijn');
        DB::unprepared('DROP PROCEDURE IF EXISTS spGetMagazijnOverzicht');
        DB::unprepared('DROP PROCEDURE IF EXISTS spCountLeveringenByProductId');
        DB::unprepared('DROP PROCEDURE IF EXISTS spGetLeveringenByProductId');
        DB::unprepared('DROP PROCEDURE IF EXISTS spCountAllergenenByProductId');
        DB::unprepared('DROP PROCEDURE IF EXISTS spGetAllergenenByProductId');
        DB::unprepared('DROP PROCEDURE IF EXISTS spCountGeleverdeProductenByLeverancierId');
    }
};
