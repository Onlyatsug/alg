
--[[


Função ToLowerCase(str: string): string
var
    Função Index(i: inteiro): string
    inicio
        se i = 0 então
            retorne str
        senão
            se str[i] >= 'A' e str[i] <= 'Z' então
                str[i] = char(asc(str[i]) + asc('a') - asc('A'))
            fim se
            retorne Index(i-1)
        fimse
    fim Função
inicio
    retorne Index(tamanho(str))
fim Função

--

Função Inverter(num: inteiro): inteiro
var
    Função Inv(n, invert: inteiro): inteiro
    inicio
        se n = 0 então
            retorne invert
        senão
            invert = invert * 10 + n % 10
            retorne Inv(n div 10, invert)
        fim se
    fim Função
inicio
    se num < 0 então
        num = num * (-1)
        retorne -Inv(num, 0)
    senão
        retorne inv(num, 0)
    fimse
fim Função

--

Função Count(n: inteiro): inteiro
inicio
    se n = 0 ou n = 1 então
        retorne 1
    senão
        retorne Count(n-1) + Count(n-2) + 1
    fim se
fim Função

--

Função MDC(a, b: inteiro): inteiro
incio
    se a < 0 ou b < 0 então
        retorne -1
    fim se
    se a < b então
        retorne MDC(b, a)
    fim se
    se a % b = 0 então
        retorne b
    senão
        retorne MDC(b, a % b)
    fimse
fim Função

--

Função CountDigit(a, b: inteiro): inteiro
var
    Função Count(num, count: inteiro): inteiro
    inicio
        se num = 0 então
            retorne count
        senão
            se num mod 10 = b então
                count <- count + 1
            fim se
            retorne Count(num div 10, count)
        fim se
    fim Função
inicio
    se b > 9 ou b < 0 ou a < 0 então
        retorne -1
    senão
        retorne Count(a, 0)
    fim se
fim Função

--

const
    MAX = 100
tipo
    array = vetor[1..MAX] de string
Função GetSmallestStr(str: array, index: inteiro): string
var
    Função Get(i: inteiro, small: string): string
    inicio
        se i = 1 então
            retorne small
        senão
            se small > str[i] então
                small <-- str[i]
            fim se
            retorne Get(i-1, small)
        fim se
    fim Função
inicio
    retorne Get(index, str[1])
fim Função

--

Função SomaSequencia(index: inteiro): inteiro
var
    s: inteiro
    Função Soma(i: inteiro): inteiro
    var
        s: inteiro
    inicio
        se i = 0 então
            escreva(0)
            retorne i
        senão
        s <-- Sum(i-1) + i
        escreva(", ", s)
        retorne s
    fim Função
inicio
    s <-- -1
    se index >= 0 então
        escreva("{")
        s <-- Sum(index)
        escreva("}")
    fim se
    retorne s
fim Função

--

Função DecToOct(num: inteiro): inteiro
var
    digit: inteiro
inicio
    se num < 0 então
        retorne -1
    fim se
    se num = 0 então
        retorne 0
    senão
        digit <-- num mod 8
        retorne DecToOct(num div 8) * 10 + digit
    fimse
fim Função

--

Função Convert(num: inteiro): string
var
    hexTable: string
    Função DecToHex(n: inteiro: hex: string): string
    inicio
        se n = 0 então
            retorne ""
        senão
            retorne DecToHex(n div 16) + hex[n % 16 + 1]
        fim se
    fim Função
incio
    se num < 0 então
        num = num * (-1)
        retorne -DecToHex(num)
    fim se
    se num = 0 então
        retorne "0"
    senão
        hexTable <-- "0123456789ABCDEF"
        retorne DecToHex(num, hexTable)
    fim se
fim Função

--

Função Convert(str: string): inteiro
var
    Função StrToInt(s: string, index: inteiro): inteiro
    var
        digit: inteiro
    inicio
        se index = 0 então
            retorne 0
        senão
            se s[index] >= '0' e s[index] <= '9' então
                digit <-- asc(s[index]) - asc('0')
                retorne StrToInt(s, index-1) * 10 + digit
            senão
                retorne StrToInt(s, index-1)
            fim se
        fim se
    fim Função
    Função IntToBin(int: inteiro): inteiro
    var
        digit: inteiro
    inicio
        se int = 0 então
            retorne 0
        senão
            digit = int mod 2
            retorne IntToBin(int div 2) * 10 + digit
        fim se
    fim Função
inicio
    se tamanho(str) = 0 então
        retorne -99999
    senão
        retorne IntToBin(StrToInt(str, tamanho(str)))
    fim se
fim Função

--

Função Convert(bin: inteiro): inteiro
var
    Função BinToDec(n, exp: inteiro): inteiro
    var
        partial: inteiro
    inicio
        se n = 0 então
            retorne 0
        fim se
        se nao (n mod 10 = 1 ou n mod 10 = 0) então
            retorne -99999
        fim se
        partial <-- BinToDec(n div 10, exp * 2)
        se partial = -99999 então
            retorne partial
        senão
            retorne partial + n mod 10 * exp
        fim se
    fim Função
inicio
    se bin < 0 então
        retorne -99999
    senão
        retorne BinToDec(bin, 1)
    fim se
fim Função

--

Função Convert(str: string): inteiro
var
    Função StrToOctInt(s: string, index: inteiro): inteiro
    var
        partial: inteiro
        digit: inteiro
    inicio
        se index = 0 então
            retorne 0
        senão
            se s[index] >= 0 e s[index] <= 7 então
                digit <-- asc(s[index]) - asc('0')
                partial <-- StrToOctInt(s, index - 1)
                se partial = -1 então
                    retorne partial
                senão
                    retorne partial * 8 + digit
                fim se
            senão
                retorne -1
            fim se
        fim se
    fim Função
inicio
    se tamanho(str) = 0 então
        retorne -1
    senão
        retorne StrToOctInt(str, tamanho(str))
    fim se
fim Função

--

Função Convert(hex: string): string
var
    Função CharToInt(ch: caracter): inteiro
    inicio
        se ch >= '0' e ch <= '9' então
            retorne asc(ch) - asc('0')
        senão
            se ch >= 'A' e ch <= 'F' então
                retorne asc(ch) - asc('A') + 10
            senão
                retorne -1
            fim se
        fim se
    fim Função
    Função HexToInt(str: string, index: inteiro): inteiro
    var
        digit, partial: inteiro
    inicio
        se index = 0 então
            retorne -1
        senão
            digit <-- CharToInt(str[index])
            se digit = -1 então
                retorne -1
            fim se
            partial <-- HexToInt(str, index - 1)
            se partial = -1 then
                retorne -1
            senão
                retorne partial * 16 + digit
            fim se
        fim se
    fim Função
    Função ToString(n: inteiro): string
    var
        resto: inteiro
    inicio
        se n < 10 então
            retorne char(n + asc('0'))
        senão
            resto <-- n mod 10
            retorne ToString(n div 10) + char(resto + asc('0'))
        fim se
    fim Função
    value: inteiro
inicio
    se tamanho(hex) = 0 então
        retorne ""
    fim se

    value <-- HexToInt(hex, tamanho(hex))
    se value = -1 então
        retorne ""
    senão
        retorne ToString(value)
    fimse
fim Função

--

Função MaiorValor(flag: real): real
var
    valor: real
    maiorRestante: real
inicio
    leia(valor)
    se valor = flag então
        retorne flag
    senão
        maiorRestante <-- MaiorValor(flag)
        se maiorRestante = flag ou valor > maiorRestante então
            retorne valor
        senão
            retorne maiorRestante
        fim se
    fim se
fim Função

--

Função UltimaPosicao(str: string, ch: caracter): inteiro
var
    Função Buscar(i: inteiro): inteiro
    var
        pos: inteiro
    inicio
        se i = 0 então
            retorne 0
        fim se
        pos <-- Buscar(i - 1)
        se str[i] = ch então
            retorne i
        senão
            retorne pos
        fim se
    fim Função
inicio
    retorne Buscar(tamanho(str))
fim Função

]]