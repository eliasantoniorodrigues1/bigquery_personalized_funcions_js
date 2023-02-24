CREATE OR REPLACE FUNCTION `project_id.dataset.f_remove_acentos`(texto STRING) 
RETURNS STRING LANGUAGE js
OPTIONS (description="Essa função recebe um texto e retorna os dados sem nenhum acento ou caracter especial.") 
AS R"""
const letra_especial = [
        "à", "á", "â", "ã", "ä", "è", "é", "ê", "ë", "ì", "í",
        "î", "ï", "ò", "ó", "ô", "õ", "ö", "ù", "ú", "û", "ü",
        "À", "Á", "Â", "Ã", "Ä", "È", "É", "Ê", "Ë", "Ì", "Í",
        "Î", "Ò", "Ó", "Ô", "Õ", "Ö", "Ù", "Ú", "Û", "Ü", "ç",
                      "Ç", "ñ", "Ñ"
    ];
    const letra_substituicao = [
        "a", "a", "a", "a", "a", "e", "e", "e", "e",
        "i", "i", "i", "i", "o", "o", "o", "o", "o", "u",
        "u", "u", "u", "A", "A", "A", "A", "A", "E", "E",
        "E", "E", "I", "I", "I", "O", "O", "O", "O", "O", "U",
        "U", "U", "U", "c", "C", "n", "N"
    ];
    let novo_texto = "";
    for (i = 0; i < texto.length; i++){
        letra = texto[i];
        if (letra_especial.includes(letra)) {
            idx = letra_especial.indexOf(letra);
            nova_letra = letra_substituicao[idx];
            novo_texto += nova_letra;
        }
        else {
            novo_texto += letra;
        }
    }
    return novo_texto;
""";
