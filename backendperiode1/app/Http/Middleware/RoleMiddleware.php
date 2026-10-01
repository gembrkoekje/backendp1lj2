<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Laat alleen gebruikers met een van de opgegeven rollen door.
     */
    public function handle(Request $request, Closure $next, string ...$rollen): Response
    {
        if (! $request->user() || ! $request->user()->hasRole(...$rollen)) {
            abort(403, 'Je hebt geen toegang tot deze pagina.');
        }

        return $next($request);
    }
}
