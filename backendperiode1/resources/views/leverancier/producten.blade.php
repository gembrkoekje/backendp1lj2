<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h1 class="text-2xl mb-2 pb-1 border-b-2 border-gray-800 inline-block">{{ $title }}</h1>

                    <div class="mb-6 space-y-1">
                        <p>Naam leverancier: {{ $leverancier->Naam }}</p>
                        <p>Contactpersoon: {{ $leverancier->ContactPersoon }}</p>
                        <p>Leverancier NR: {{ $leverancier->LeverancierNummer }}</p>
                        <p>Mobiel: {{ $leverancier->Mobiel }}</p>
                    </div>

                    <table class="min-w-full border border-gray-800">
                        <thead>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Naam product</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Aantal in Magazijn</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Verpakkingseenheid</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Laatste levering</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($producten as $product)
                                <tr>
                                    <td class="border border-gray-800 px-4 py-2">{{ $product->Naam }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ $product->AantalAanwezig ?? 0 }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ str_replace('.', ',', rtrim(rtrim($product->VerpakkingsEenheid, '0'), '.')) }} kg</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ date('d-m-Y', strtotime($product->LaatsteLevering)) }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <div class="flex justify-end gap-3 mt-4">
                        <a href="{{ route('leverancier.index') }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Terug</a>
                        <a href="{{ route('dashboard') }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
