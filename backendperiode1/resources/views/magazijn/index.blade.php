<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h1 class="text-2xl mb-6 pb-1 border-b-2 border-gray-800 inline-block">{{ $title }}</h1>

                    <table class="min-w-full border border-gray-800">
                        <thead>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Barcode</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Naam</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Verpakkingseenheid</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Aantal aanwezig</th>
                                <th class="border border-gray-800 px-4 py-2 text-center font-normal">Allergenen Info</th>
                                <th class="border border-gray-800 px-4 py-2 text-center font-normal">Leverantie Info</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($producten as $product)
                                <tr>
                                    <td class="border border-gray-800 px-4 py-2">{{ $product->Barcode }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ $product->Naam }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ str_replace('.', ',', rtrim(rtrim($product->VerpakkingsEenheid, '0'), '.')) }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ $product->AantalAanwezig }}</td>
                                    <td class="border border-gray-800 px-4 py-2 text-center">
                                        <a href="{{ route('magazijn.allergenen', $product->Id) }}" title="Allergenen Info" class="inline-block">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                                 fill="none" stroke="#dc2626" stroke-width="4" stroke-linecap="round">
                                                <line x1="5" y1="5" x2="19" y2="19" />
                                                <line x1="19" y1="5" x2="5" y2="19" />
                                            </svg>
                                        </a>
                                    </td>
                                    <td class="border border-gray-800 px-4 py-2 text-center">
                                        <a href="{{ route('magazijn.leveringsinformatie', $product->Id) }}" title="Leverantie Info"
                                           style="color: #2563eb; font-size: 1.5rem; font-weight: bold; text-decoration: none;">?</a>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="border border-gray-800 px-4 py-2 text-center">
                                        Er zijn geen producten in het magazijn gevonden
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
