<?php

namespace App\Http\Controllers;

use Closure;
use Illuminate\Pagination\LengthAwarePaginator;

abstract class Controller
{
    /**
     * Het maximaal aantal records per pagina.
     */
    protected const RECORDS_PER_PAGINA = 4;

    /**
     * Maakt server-side pagination: alleen de records van de gekozen pagina worden opgehaald.
     *
     * @param  Closure(int $limit, int $offset): array  $haalRecordsOp
     */
    protected function pagineer(int $totaal, Closure $haalRecordsOp): LengthAwarePaginator
    {
        $laatstePagina = max(1, (int) ceil($totaal / self::RECORDS_PER_PAGINA));
        $pagina = min(LengthAwarePaginator::resolveCurrentPage(), $laatstePagina);
        $offset = ($pagina - 1) * self::RECORDS_PER_PAGINA;

        return new LengthAwarePaginator(
            $haalRecordsOp(self::RECORDS_PER_PAGINA, $offset),
            $totaal,
            self::RECORDS_PER_PAGINA,
            $pagina,
            ['path' => LengthAwarePaginator::resolveCurrentPath()],
        );
    }
}
