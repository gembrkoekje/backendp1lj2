<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 max-w-xl">
                    <h1 class="text-2xl mb-6 pb-1 border-b-2 border-gray-800 inline-block">{{ $title }}</h1>

                    <table class="w-full border border-gray-800">
                        <tbody>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal w-1/2">Naam</th>
                                <td class="border border-gray-800 px-4 py-2">{{ $leverancier->Naam }}</td>
                            </tr>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal w-1/2">Contactpersoon</th>
                                <td class="border border-gray-800 px-4 py-2">{{ $leverancier->ContactPersoon }}</td>
                            </tr>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal w-1/2">Leveranciernummer</th>
                                <td class="border border-gray-800 px-4 py-2">{{ $leverancier->LeverancierNummer }}</td>
                            </tr>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal w-1/2">Mobiel</th>
                                <td class="border border-gray-800 px-4 py-2">{{ $leverancier->Mobiel }}</td>
                            </tr>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal w-1/2">Straatnaam</th>
                                <td class="border border-gray-800 px-4 py-2">{{ $leverancier->Straat }}</td>
                            </tr>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal w-1/2">Huisnummer</th>
                                <td class="border border-gray-800 px-4 py-2">{{ $leverancier->Huisnummer }}</td>
                            </tr>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal w-1/2">Postcode</th>
                                <td class="border border-gray-800 px-4 py-2">{{ $leverancier->Postcode }}</td>
                            </tr>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal w-1/2">Stad</th>
                                <td class="border border-gray-800 px-4 py-2">{{ $leverancier->Stad }}</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="flex items-center gap-3 mt-4">
                        <a href="{{ route('leverancier.edit', $leverancier->Id) }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Wijzig</a>
                        <span class="flex-1"></span>
                        <a href="{{ route('leverancier.wijzigen.index') }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Terug</a>
                        <a href="{{ route('dashboard') }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
