<?php

namespace App\Http\Controllers;

use App\Http\Requests\LeverancierUpdateRequest;
use App\Models\LeverancierModel;
use Illuminate\Http\Request;

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

    /**
     * Toont het detailscherm Levering product (Wireframe-04).
     */
    public function createLevering(int $leverancierId, int $productId)
    {
        $product = $this->leverancierModel->getProductVanLeverancier($leverancierId, $productId);

        if (! $product) {
            return redirect()->route('leverancier.producten', $leverancierId);
        }

        return view('leverancier.levering', [
            'title' => 'Levering Product',
            'product' => $product,
        ]);
    }

    /**
     * Slaat een nieuwe levering op en verhoogt het aantal van het product in het magazijn.
     */
    public function storeLevering(Request $request, int $leverancierId, int $productId)
    {
        $product = $this->leverancierModel->getProductVanLeverancier($leverancierId, $productId);

        if (! $product) {
            return redirect()->route('leverancier.producten', $leverancierId);
        }

        $gegevens = $request->validate([
            'aantal' => ['required', 'integer', 'min:1'],
            'datum_eerstvolgende_levering' => ['required', 'date'],
        ], [
            'aantal.required' => 'Vul het aantal producteenheden in.',
            'aantal.integer' => 'Het aantal producteenheden moet een geheel getal zijn.',
            'aantal.min' => 'Het aantal producteenheden moet minimaal 1 zijn.',
            'datum_eerstvolgende_levering.required' => 'Vul de datum van de eerstvolgende levering in.',
            'datum_eerstvolgende_levering.date' => 'Vul een geldige datum in.',
        ]);

        // Een product dat niet meer actief is wordt niet meer geproduceerd en kan niet geleverd worden
        if (! $product->ProductIsActief) {
            return redirect()
                ->route('leverancier.levering.create', [$leverancierId, $productId])
                ->with('melding', "Het product {$product->ProductNaam} van de leverancier {$product->LeverancierNaam} wordt niet meer geproduceerd");
        }

        $this->leverancierModel->createLevering(
            $leverancierId,
            $productId,
            (int) $gegevens['aantal'],
            $gegevens['datum_eerstvolgende_levering'],
        );

        return redirect()->route('leverancier.producten', $leverancierId);
    }

    /**
     * Toont het scherm Overzicht leveranciers met een pen-icoon per leverancier (Wireframe-02).
     */
    public function wijzigenOverzicht()
    {
        $leveranciers = $this->pagineer(
            $this->leverancierModel->getAantalLeveranciers(),
            fn (int $limit, int $offset) => $this->leverancierModel->getLeveranciersWijzigen($limit, $offset),
        );

        return view('leverancier.wijzigen', [
            'title' => 'Overzicht leveranciers',
            'leveranciers' => $leveranciers,
        ]);
    }

    /**
     * Toont het scherm Leverancier Details van de gekozen leverancier (Wireframe-03).
     */
    public function details(int $leverancierId)
    {
        $leverancier = $this->leverancierModel->getLeverancierDetailsById($leverancierId);

        if (! $leverancier) {
            return redirect()->route('leverancier.wijzigen.index');
        }

        return view('leverancier.details', [
            'title' => 'Leverancier Details',
            'leverancier' => $leverancier,
        ]);
    }

    /**
     * Toont het scherm Wijzig Leveranciergegevens (Wireframe-04).
     */
    public function edit(int $leverancierId)
    {
        $leverancier = $this->leverancierModel->getLeverancierDetailsById($leverancierId);

        if (! $leverancier) {
            return redirect()->route('leverancier.wijzigen.index');
        }

        return view('leverancier.edit', [
            'title' => 'Wijzig Leveranciergegevens',
            'leverancier' => $leverancier,
        ]);
    }

    /**
     * Slaat de gewijzigde leveranciergegevens op en toont een melding of het gelukt is.
     */
    public function update(LeverancierUpdateRequest $request, int $leverancierId)
    {
        if (! $this->leverancierModel->getLeverancierDetailsById($leverancierId)) {
            return redirect()->route('leverancier.wijzigen.index');
        }

        $gelukt = $this->leverancierModel->updateLeverancier($leverancierId, $request->validated());

        return redirect()
            ->route('leverancier.edit', $leverancierId)
            ->with('gelukt', $gelukt)
            ->with('melding', $gelukt
                ? 'De wijzigingen zijn doorgevoerd'
                : 'Door een technische storing is het niet mogelijk de wijziging door te voeren. Probeer het op een later moment nog eens');
    }
}
