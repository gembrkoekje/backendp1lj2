<?php

namespace App\Http\Controllers;

use App\Models\MagazijnModel;

class MagazijnController extends Controller
{
    private MagazijnModel $magazijnModel;

    public function __construct()
    {
        $this->magazijnModel = new MagazijnModel();
    }

    /**
     * Toont het scherm Overzicht Magazijn Jamin.
     */
    public function index()
    {
        $producten = $this->magazijnModel->getMagazijnOverzicht();

        return view('magazijn.index', [
            'title' => 'Overzicht Magazijn Jamin',
            'producten' => $producten,
        ]);
    }
}
