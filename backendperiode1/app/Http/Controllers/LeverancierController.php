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

    /**
     * Toont het detailscherm Geleverde producten van de gekozen leverancier (Wireframe-02).
     */
    public function producten(int $leverancierId)
    {
        $leverancier = $this->leverancierModel->getLeverancierById($leverancierId);

        if (! $leverancier) {
            return redirect()->route('leverancier.index');
        }

        $producten = $this->leverancierModel->getGeleverdeProductenByLeverancierId($leverancierId);

        return view('leverancier.producten', [
            'title' => 'Geleverde producten',
            'leverancier' => $leverancier,
            'producten' => $producten,
        ]);
    }
}
