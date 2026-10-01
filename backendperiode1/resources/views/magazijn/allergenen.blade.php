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
                    <div class="mb-6 space-y-1">
                        <p><span class="font-semibold">Naam:</span> {{ $product->Naam }}</p>
                        <p><span class="font-semibold">Barcode:</span> {{ $product->Barcode }}</p>
                    </div>

                    <table class="min-w-full border border-gray-300">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="border border-gray-300 px-4 py-2 text-left">Naam</th>
                                <th class="border border-gray-300 px-4 py-2 text-left">Omschrijving</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($allergenen as $allergeen)
                                <tr>
                                    <td class="border border-gray-300 px-4 py-2">{{ $allergeen->Naam }}</td>
                                    <td class="border border-gray-300 px-4 py-2">{{ $allergeen->Omschrijving }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="2" class="border border-gray-300 px-4 py-2 text-center">
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

                    <a href="{{ route('magazijn.index') }}" class="inline-block mt-6 text-blue-600 hover:underline">
                        Terug naar Overzicht Magazijn Jamin
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
