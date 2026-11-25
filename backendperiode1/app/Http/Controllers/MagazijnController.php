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
        $producten = $this->pagineer(
            $this->magazijnModel->getAantalMagazijn(),
            fn (int $limit, int $offset) => $this->magazijnModel->getMagazijnOverzicht($limit, $offset),
        );

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
        $aantalLeveringen = $this->magazijnModel->getAantalLeveringen($productId);
        $leveringen = $this->pagineer(
            $aantalLeveringen,
            fn (int $limit, int $offset) => $this->magazijnModel->getLeveringenByProductId($productId, $limit, $offset),
        );

        $geenVoorraad = empty($product->AantalAanwezig);
        $eerstVolgendeLevering = null;

        // De laatste levering staat op de laatste pagina, daarom wordt deze apart opgehaald
        if ($geenVoorraad && $aantalLeveringen > 0) {
            [$laatsteLevering] = $this->magazijnModel->getLeveringenByProductId($productId, 1, $aantalLeveringen - 1);
            $eerstVolgendeLevering = $laatsteLevering->DatumEerstVolgendeLevering;
        }

        return view('magazijn.leveringsinformatie', [
            'title' => 'Leverings Informatie',
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

        $allergenen = $this->pagineer(
            $this->magazijnModel->getAantalAllergenen($productId),
            fn (int $limit, int $offset) => $this->magazijnModel->getAllergenenByProductId($productId, $limit, $offset),
        );

        return view('magazijn.allergenen', [
            'title' => 'Overzicht Allergenen',
            'product' => $product,
            'allergenen' => $allergenen,
        ]);
    }
}
