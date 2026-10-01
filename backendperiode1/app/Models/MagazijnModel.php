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
}
