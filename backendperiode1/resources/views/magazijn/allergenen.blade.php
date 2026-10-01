<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h1 class="text-2xl mb-2 pb-1 border-b-2 border-gray-800 inline-block">{{ $title }}</h1>

                    <div class="mb-6 space-y-1">
                        <p>Naam: {{ $product->Naam }}</p>
                        <p>Barcode: {{ $product->Barcode }}</p>
                    </div>

                    <table class="border border-gray-800">
                        <thead>
                            <tr>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Naam</th>
                                <th class="border border-gray-800 px-4 py-2 text-left font-normal">Omschrijving</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($allergenen as $allergeen)
                                <tr>
                                    <td class="border border-gray-800 px-4 py-2">{{ $allergeen->Naam }}</td>
                                    <td class="border border-gray-800 px-4 py-2">{{ $allergeen->Omschrijving }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="2" class="border border-gray-800 px-4 py-2 text-center">
                                        In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    @if (empty($allergenen))
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
