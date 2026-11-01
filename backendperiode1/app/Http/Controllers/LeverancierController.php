<?php

namespace App\Http\Controllers;

use App\Models\LeverancierModel;

class LeverancierController extends Controller
{
    private LeverancierModel $leverancierModel;

    public function __construct()
    {
        $this->leverancierModel = new LeverancierModel();
    }

    /**
     * Toont het scherm Overzicht leveranciers (Wireframe-01).
     */
    public function index()
    {
        $leveranciers = $this->leverancierModel->getAllLeveranciers();

        return view('leverancier.index', [
            'title' => 'Overzicht leveranciers',
            'leveranciers' => $leveranciers,
        ]);
    }
}
