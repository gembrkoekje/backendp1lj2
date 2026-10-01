<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ $title }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <table class="min-w-full border border-gray-300">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="border border-gray-300 px-4 py-2 text-left">Barcode</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Naam</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Verpakkingseenheid</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Aantal aanwezig</th>
                                <th class="border border-gray-300 px-4 py-2 text-center">Allergenen Info</th>
                                <th class="border border-gray-300 px-4 py-2 text-center">Leverantie Info</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($producten as $product)
                                <tr>
                                    <td class="border border-gray-300 px-4 py-2">{{ $product->Barcode }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $product->Naam }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $product->VerpakkingsEenheid }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $product->AantalAanwezig }}</td>
                                    <td class="border border-gray-300 px-4 py-2 text-center">
                                        <a href="{{ route('magazijn.allergenen', $product->Id) }}"
                                           title="Allergenen Info"
                                           style="color: #dc2626; font-size: 1.4rem; font-weight: bold; text-decoration: none;">&#10006;</a>
                                    </td>
                                    <td class="border border-gray-300 px-4 py-2 text-center">
                                        <a href="{{ route('magazijn.leveringsinformatie', $product->Id) }}"
                                           title="Leverantie Info"
                                           style="color: #2563eb; font-size: 1.4rem; font-weight: bold; text-decoration: none;">&#63;</a>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="border border-gray-300 px-4 py-2 text-center">
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
