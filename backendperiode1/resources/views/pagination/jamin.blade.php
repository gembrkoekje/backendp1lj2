@if ($paginator->hasPages())
    <nav class="flex items-center gap-2 mt-4" aria-label="Paginering">
        @if ($paginator->onFirstPage())
            <span class="border border-gray-300 text-gray-400 px-3 py-1">Vorige</span>
        @else
            <a href="{{ $paginator->previousPageUrl() }}" rel="prev" class="border border-gray-800 px-3 py-1 hover:bg-gray-100">Vorige</a>
        @endif

        @foreach ($paginator->getUrlRange(1, $paginator->lastPage()) as $pagina => $url)
            @if ($pagina === $paginator->currentPage())
                <span aria-current="page" class="border border-gray-800 bg-gray-800 text-white px-3 py-1">{{ $pagina }}</span>
            @else
                <a href="{{ $url }}" class="border border-gray-800 px-3 py-1 hover:bg-gray-100">{{ $pagina }}</a>
            @endif
        @endforeach

        @if ($paginator->hasMorePages())
            <a href="{{ $paginator->nextPageUrl() }}" rel="next" class="border border-gray-800 px-3 py-1 hover:bg-gray-100">Volgende</a>
        @else
            <span class="border border-gray-300 text-gray-400 px-3 py-1">Volgende</span>
        @endif

        <span class="ml-2">{{ $paginator->firstItem() }} t/m {{ $paginator->lastItem() }} van {{ $paginator->total() }}</span>
    </nav>
@endif
