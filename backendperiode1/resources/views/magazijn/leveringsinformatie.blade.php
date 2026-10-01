<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h1 class="text-2xl mb-2 pb-1 border-b-2 border-gray-800 inline-block">{{ $title }}</h1>

                    @if ($leverancier)
                        <div class="mb-6 space-y-1">
                            <p>Naam Leverancier: {{ $leverancier->Naam }}</p>
                            <p>Contactpersoon leverancier: {{ $leverancier->ContactPersoon }}</p>
                            <p>Leverancier nummer: {{ $leverancier->LeverancierNummer }}</p>
                            <p>Mobiel: {{ $leverancier->Mobiel }}</p>
                        </div>
                    @endif

                    <table class="min-w-full border border-gray-800">
                        <thead>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Naam Product</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Datum laatste levering</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Aantal</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Eerstvolgende levering</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($geenVoorraad)
                                <tr>
                                    <td colspan="4" class="border border-gray-800 px-4 py-2 text-center">
                                        Er is van dit product op dit moment geen voorraad aanwezig, de verwachte eerstvolgende levering is:
                                        {{ $eerstVolgendeLevering ? date('d-m-Y', strtotime($eerstVolgendeLevering)) : 'onbekend' }}
                                    </td>
                                </tr>
                            @else
                            @forelse ($leveringen as $levering)
                                <tr>
                                    <td class="border border-gray-800 px-4 py-2">{{ $levering->Naam }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ date('d-m-Y', strtotime($levering->DatumLevering)) }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ $levering->Aantal }}</td>
                                    <td class="border border-gray-800 px-4 py-2">
                                        {{ $levering->DatumEerstVolgendeLevering ? date('d-m-Y', strtotime($levering->DatumEerstVolgendeLevering)) : '-' }}
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="border border-gray-800 px-4 py-2 text-center">
                                        Er zijn geen leveringen gevonden voor dit product
                                    </td>
                                </tr>
                            @endforelse
                            @endif
                        </tbody>
                    </table>

                    @if ($geenVoorraad)
                        <script>
                            setTimeout(function () {
                                window.location.href = "{{ route('magazijn.index') }}";
                            }, 4000);
                        </script>
                    @endif
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
