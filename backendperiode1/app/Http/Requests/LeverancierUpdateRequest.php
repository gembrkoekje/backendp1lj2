<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LeverancierUpdateRequest extends FormRequest
{
    /**
     * De validatieregels voor het scherm Wijzig Leveranciergegevens.
     *
     * @return array<string, array<int, string>>
     */
    public function rules(): array
    {
        return [
            'naam' => ['required', 'string', 'max:100'],
            'contactpersoon' => ['required', 'string', 'max:100'],
            'leveranciernummer' => ['required', 'string', 'max:20'],
            'mobiel' => ['required', 'string', 'regex:/^06-[0-9]{8}$/'],
            'straatnaam' => ['required', 'string', 'max:100'],
            'huisnummer' => ['required', 'string', 'max:10'],
            'postcode' => ['required', 'string', 'max:7'],
            'stad' => ['required', 'string', 'max:100'],
        ];
    }

    /**
     * De Nederlandse foutmeldingen.
     *
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'required' => 'Het veld :attribute is verplicht.',
            'max' => 'Het veld :attribute mag maximaal :max tekens bevatten.',
            'mobiel.regex' => 'Het veld mobiel moet het formaat 06-12345678 hebben.',
        ];
    }
}
