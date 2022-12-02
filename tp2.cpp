#include <iostream>
#include <array>
#include <iomanip>

int main()
{

    int vet[] = {7, 20, 8, 5, 1, 8, 4, 2, 5, 5, 14, 12, 3, 8}; // n = 14
    int mediana = 0;
    int media = 0;
    int moda = 0;
    int tamModa = 0;
    int vetSize = 0;
    int aux = 0;
    int soma = 0;
    int atual = 0;
    int tamAtual = 0;

    // TAMANHO ==========================================================

    vetSize = *(&vet + 1) - vet;
    std::cout << "vetSize: " << vetSize << std::endl;

    // ORDENAÇÃO ==========================================================

    for (int i = 0; i < vetSize; i++)
    {
        for (int j = 0; j < vetSize; j++)
        {
            if (vet[i] < vet[j])
            {
                aux = vet[i];
                vet[i] = vet[j];
                vet[j] = aux;
            }
        }
    }
    std::cout << "Vetor Ordenado: ";

    for (int k = 0; k < vetSize; k++)
    {
        std::cout << " " << vet[k];
    }

    // MEDIANA ==========================================================

    if (vetSize % 2 != 0)
    {
        mediana = vet[vetSize / 2];
    }
    else
    {
        mediana = (vet[vetSize / 2 - 1] + vet[vetSize / 2]) / 2;
    }

    std::cout << std::endl
              << "Mediana: " << mediana << std::endl;

    // MÉDIA ==========================================================

    for (int i = 0; i < vetSize; i++)
    {
        soma = soma + vet[i];
    }
    media = soma / vetSize;
    std::cout << "Media: " << media << std::endl;

    // MODA ==========================================================

    for (int i = 0; i < vetSize; i++)
    {
        if (atual == vet[i])
        {
            tamAtual++;
        }
        else
        {
            if (tamAtual > tamModa)
            {
                moda = atual;
                tamModa = tamAtual;
            }
            atual = vet[i];
            tamAtual = 1;
        }
    }

    std::cout << "Moda: " << moda << std::endl;
}
