<?php

use App\Http\Controllers\LeverancierController;
use App\Http\Controllers\MagazijnController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::middleware('role:admin,magazijnmedewerker')->group(function () {
        Route::get('/magazijn', [MagazijnController::class, 'index'])->name('magazijn.index');
        Route::get('/magazijn/{productId}/leveringsinformatie', [MagazijnController::class, 'leveringsinformatie'])
            ->whereNumber('productId')
            ->name('magazijn.leveringsinformatie');
        Route::get('/magazijn/{productId}/allergenen', [MagazijnController::class, 'allergenen'])
            ->whereNumber('productId')
            ->name('magazijn.allergenen');

        Route::get('/leveranciers', [LeverancierController::class, 'index'])->name('leverancier.index');
        Route::get('/leveranciers/{leverancierId}/producten', [LeverancierController::class, 'producten'])
            ->whereNumber('leverancierId')
            ->name('leverancier.producten');
        Route::get('/leveranciers/{leverancierId}/producten/{productId}/levering', [LeverancierController::class, 'createLevering'])
            ->whereNumber(['leverancierId', 'productId'])
            ->name('leverancier.levering.create');
        Route::post('/leveranciers/{leverancierId}/producten/{productId}/levering', [LeverancierController::class, 'storeLevering'])
            ->whereNumber(['leverancierId', 'productId'])
            ->name('leverancier.levering.store');
    });

    Route::middleware('role:admin,manager')->group(function () {
        Route::get('/leveranciers/wijzigen', [LeverancierController::class, 'wijzigenOverzicht'])
            ->name('leverancier.wijzigen.index');
        Route::get('/leveranciers/{leverancierId}/details', [LeverancierController::class, 'details'])
            ->whereNumber('leverancierId')
            ->name('leverancier.details');
        Route::get('/leveranciers/{leverancierId}/wijzigen', [LeverancierController::class, 'edit'])
            ->whereNumber('leverancierId')
            ->name('leverancier.edit');
        Route::put('/leveranciers/{leverancierId}', [LeverancierController::class, 'update'])
            ->whereNumber('leverancierId')
            ->name('leverancier.update');
    });
});

require __DIR__.'/auth.php';
