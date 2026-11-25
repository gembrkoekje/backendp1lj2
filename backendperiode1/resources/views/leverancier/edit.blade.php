<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 max-w-xl">
                    <h1 class="text-2xl mb-6 pb-1 border-b-2 border-gray-800 inline-block">{{ $title }}</h1>

                    @if (session('melding'))
                        <div class="mb-4 border px-4 py-2 {{ session('gelukt') ? 'border-green-600 bg-green-50 text-green-700' : 'border-red-600 bg-red-50 text-red-700' }}">
                            {{ session('melding') }}
                        </div>

                        <script>
                            setTimeout(function () {
                                window.location.href = "{{ route('leverancier.details', $leverancier->Id) }}";
                            }, 3000);
                        </script>
                    @endif

                    <form method="POST" action="{{ route('leverancier.update', $leverancier->Id) }}">
                        @csrf
                        @method('PUT')

                        @if ($errors->any())
                            <div class="mb-4 text-red-600">
                                @foreach ($errors->all() as $error)
                                    <p>{{ $error }}</p>
                                @endforeach
                            </div>
                        @endif

                        <div class="flex items-center mb-3">
                            <label for="naam" class="w-56">Naam:</label>
                            <input type="text" id="naam" name="naam" maxlength="100" value="{{ old('naam', $leverancier->Naam) }}"
                                   class="border border-gray-800 px-2 py-1 flex-1">
                        </div>
                        <div class="flex items-center mb-3">
                            <label for="contactpersoon" class="w-56">Contactpersoon:</label>
                            <input type="text" id="contactpersoon" name="contactpersoon" maxlength="100" value="{{ old('contactpersoon', $leverancier->ContactPersoon) }}"
                                   class="border border-gray-800 px-2 py-1 flex-1">
                        </div>
                        <div class="flex items-center mb-3">
                            <label for="leveranciernummer" class="w-56">Leveranciernummer:</label>
                            <input type="text" id="leveranciernummer" name="leveranciernummer" maxlength="20" value="{{ old('leveranciernummer', $leverancier->LeverancierNummer) }}"
                                   class="border border-gray-800 px-2 py-1 flex-1">
                        </div>
                        <div class="flex items-center mb-3">
                            <label for="mobiel" class="w-56">Mobiel:</label>
                            <input type="text" id="mobiel" name="mobiel" maxlength="15" value="{{ old('mobiel', $leverancier->Mobiel) }}"
                                   class="border border-gray-800 px-2 py-1 flex-1">
                        </div>
                        <div class="flex items-center mb-3">
                            <label for="straatnaam" class="w-56">Straatnaam:</label>
                            <input type="text" id="straatnaam" name="straatnaam" maxlength="100" value="{{ old('straatnaam', $leverancier->Straat) }}"
                                   class="border border-gray-800 px-2 py-1 flex-1">
                        </div>
                        <div class="flex items-center mb-3">
                            <label for="huisnummer" class="w-56">Huisnummer:</label>
                            <input type="text" id="huisnummer" name="huisnummer" maxlength="10" value="{{ old('huisnummer', $leverancier->Huisnummer) }}"
                                   class="border border-gray-800 px-2 py-1 flex-1">
                        </div>
                        <div class="flex items-center mb-3">
                            <label for="postcode" class="w-56">Postcode:</label>
                            <input type="text" id="postcode" name="postcode" maxlength="7" value="{{ old('postcode', $leverancier->Postcode) }}"
                                   class="border border-gray-800 px-2 py-1 flex-1">
                        </div>
                        <div class="flex items-center mb-3">
                            <label for="stad" class="w-56">Stad:</label>
                            <input type="text" id="stad" name="stad" maxlength="100" value="{{ old('stad', $leverancier->Stad) }}"
                                   class="border border-gray-800 px-2 py-1 flex-1">
                        </div>

                        <div class="flex items-center gap-3 mt-6">
                            <button type="submit" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Sla op</button>
                            <span class="flex-1"></span>
                            <a href="{{ route('leverancier.details', $leverancier->Id) }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Terug</a>
                            <a href="{{ route('dashboard') }}" class="border border-gray-800 px-6 py-1 hover:bg-gray-100">Home</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
