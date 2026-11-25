<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Voegt de rol manager toe aan de tabel users.
     */
    public function up(): void
    {
        DB::statement("ALTER TABLE users MODIFY rolename ENUM('magazijnmedewerker', 'admin', 'klant', 'manager') NOT NULL");
    }

    /**
     * Verwijdert de rol manager weer (bestaande managers worden klant).
     */
    public function down(): void
    {
        DB::statement("UPDATE users SET rolename = 'klant' WHERE rolename = 'manager'");
        DB::statement("ALTER TABLE users MODIFY rolename ENUM('magazijnmedewerker', 'admin', 'klant') NOT NULL");
    }
};
