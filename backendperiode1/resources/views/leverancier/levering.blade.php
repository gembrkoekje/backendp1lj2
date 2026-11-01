<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 max-w-xl">
                    <h1 class="text-2xl mb-2 pb-1 border-b-2 border-gray-800 inline-block">{{ $title }}</h1>

                    <div class="mb-6 space-y-1">
                        <p>Product: {{ $product->ProductNaam }}</p>
                        <p>Leverancier: {{ $product->LeverancierNaam }}</p>
                        <p>Contactpersoon: {{ $product->ContactPersoon }}</p>
                        <p>Mobiel: {{ $product->Mobiel }}</p>
                    </div>

                    @if (session('melding'))
                        <div class="mb-4 border border-red-600 bg-red-50 text-red-700 px-4 py-2">
                            {{ session('melding') }}
                        </div>

                        <script>
                            setTimeout(function () {
                                window.location.href = "{{ route('leverancier.producten', $product->LeverancierId) }}";
                            }, 4000);
                        </script>
                    @endif

                    <form method="POST" action="{{ route('leverancier.levering.store', [$product->LeverancierId, $product->ProductId]) }}">
                        @csrf

                        @if ($errors->any())
                            <div class="mb-4 text-red-600">
                                @foreach ($errors->all() as $error)
                                    <p>{{ $error }}</p>
                                @endforeach
                            </div>
                        @endif

                        <div class="flex items-center mb-3">
                            <label for="aantal" class="w-56">Aantal producteenheden</label>
                            <input type="number" id="aantal" name="aantal" min="1" value="{{ old('aantal') }}"
                                   class="border border-gray-800 px-2 py-1 w-56">
                        </div>
                        <div class="flex items-center mb-6">
                            <label for="datum_eerstvolgende_levering" class="w-56">Datum eerstvolgende levering</label>
                            <input type="date" id="datum_eerstvolgende_levering" name="datum_eerstvolgende_levering"
                                   value="{{ old('datum_eerstvolgende_levering') }}"
                                   class="border border-gray-800 px-2 py-1 w-56">
                        </div>

                        <div class="flex items-center gap-3">
                            <button type="submit" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Sla op</button>
                            <span class="flex-1"></span>
                            <a href="{{ route('leverancier.producten', $product->LeverancierId) }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Terug</a>
                            <a href="{{ route('dashboard') }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Home</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
