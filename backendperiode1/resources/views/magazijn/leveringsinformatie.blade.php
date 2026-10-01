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
                    @if ($leverancier)
                        <div class="mb-6 space-y-1">
                            <p><span class="font-semibold">Naam leverancier:</span> {{ $leverancier->Naam }}</p>
                            <p><span class="font-semibold">Contactpersoon leverancier:</span> {{ $leverancier->ContactPersoon }}</p>
                            <p><span class="font-semibold">Leveranciernummer:</span> {{ $leverancier->LeverancierNummer }}</p>
                            <p><span class="font-semibold">Mobiel:</span> {{ $leverancier->Mobiel }}</p>
                        </div>
                    @endif

                    <table class="min-w-full border border-gray-300">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="border border-gray-300 px-4 py-2 text-left">Naam Product</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Datum laatste levering</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Aantal</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Eerstvolgende levering</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($leveringen as $levering)
                                <tr>
                                    <td class="border border-gray-300 px-4 py-2">{{ $levering->Naam }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ date('d-m-Y', strtotime($levering->DatumLevering)) }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $levering->Aantal }}</td>
                                    <td class="border border-gray-300 px-4 py-2">
                                        {{ $levering->DatumEerstVolgendeLevering ? date('d-m-Y', strtotime($levering->DatumEerstVolgendeLevering)) : '-' }}
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="border border-gray-300 px-4 py-2 text-center">
                                        Er zijn geen leveringen gevonden voor dit product
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <a href="{{ route('magazijn.index') }}" class="inline-block mt-6 text-blue-600 hover:underline">
                        Terug naar Overzicht Magazijn Jamin
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
