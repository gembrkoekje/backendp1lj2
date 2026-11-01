<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Maakt de stored procedures voor de user story Toevoegen producten aan.
     */
    public function up(): void
    {
        $sql = file_get_contents(database_path('migrations/sp_toevoegen_product.sql'));

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
        DB::unprepared('DROP PROCEDURE IF EXISTS spGetProductVanLeverancier');
        DB::unprepared('DROP PROCEDURE IF EXISTS spCreateLevering');
    }
};
