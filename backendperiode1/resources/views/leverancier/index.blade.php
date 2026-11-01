<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h1 class="text-2xl mb-6 pb-1 border-b-2 border-gray-800 inline-block">{{ $title }}</h1>

                    <table class="min-w-full border border-gray-800">
                        <thead>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Naam</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Contactpersoon</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Leveranciernummer</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Mobiel</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Aantal verschillende producten</th>
                                <th class="border border-gray-800 px-4 py-2 text-center font-normal">Toon producten</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($leveranciers as $leverancier)
                                <tr>
                                    <td class="border border-gray-800 px-4 py-2">{{ $leverancier->Naam }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ $leverancier->ContactPersoon }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ $leverancier->LeverancierNummer }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ $leverancier->Mobiel }}</td>
                                    <td class="border border-gray-800 px-4 py-2 text-center">{{ $leverancier->AantalVerschillendeProducten }}</td>
                                    <td class="border border-gray-800 px-4 py-2 text-center">
                                        <span title="Toon producten" class="inline-block">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                                 fill="none" stroke="#1f2937" stroke-width="1.5" stroke-linejoin="round">
                                                <path d="M12 2.5 3 7v10l9 4.5 9-4.5V7z" />
                                                <path d="M3 7l9 4.5L21 7" />
                                                <path d="M12 11.5v10" />
                                            </svg>
                                        </span>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="border border-gray-800 px-4 py-2 text-center">
                                        Er zijn geen leveranciers gevonden
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <div class="flex justify-end mt-4">
                        <a href="{{ route('dashboard') }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
