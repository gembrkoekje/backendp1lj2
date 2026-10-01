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

    /**
     * Toont het detailscherm Levering Informatie van het gekozen product.
     */
    public function leveringsinformatie(int $productId)
    {
        $product = $this->magazijnModel->getMagazijnByProductId($productId);

        if (! $product) {
            return redirect()->route('magazijn.index');
        }

        $leverancier = $this->magazijnModel->getLeverancierByProductId($productId);
        $leveringen = $this->magazijnModel->getLeveringenByProductId($productId);

        $geenVoorraad = empty($product->AantalAanwezig);
        $eerstVolgendeLevering = null;

        if ($geenVoorraad && ! empty($leveringen)) {
            $eerstVolgendeLevering = end($leveringen)->DatumEerstVolgendeLevering;
        }

        return view('magazijn.leveringsinformatie', [
            'title' => 'Levering Informatie',
            'leverancier' => $leverancier,
            'leveringen' => $leveringen,
            'geenVoorraad' => $geenVoorraad,
            'eerstVolgendeLevering' => $eerstVolgendeLevering,
        ]);
    }

    /**
     * Toont het detailscherm Overzicht Allergenen van het gekozen product.
     */
    public function allergenen(int $productId)
    {
        $product = $this->magazijnModel->getMagazijnByProductId($productId);

        if (! $product) {
            return redirect()->route('magazijn.index');
        }

        $allergenen = $this->magazijnModel->getAllergenenByProductId($productId);

        return view('magazijn.allergenen', [
            'title' => 'Overzicht Allergenen',
            'product' => $product,
            'allergenen' => $allergenen,
        ]);
    }
}
