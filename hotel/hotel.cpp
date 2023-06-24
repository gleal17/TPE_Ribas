#include <bits/stdc++.h>

using namespace std;

int main()
{
    int qtd, pontuacao;
    char res;
    vector<string> homens;
    vector<string> mulheres;
    pair<string, string> dupla;
    vector<pair<string, string>> casais;
    vector<pair<string, string>> afinidade;
    vector<int> pontuacaoAfinidade;
    string nome, nome2;
    pair<char, int> quarto;
    vector<pair<char, int>> quartos;

    cin >> qtd;
    for (int i = 0; i < qtd; i++)
    {
        cin >> quarto.first >> quarto.second;
        quartos.push_back(quarto);
    }
    cin >> qtd >> res;

    if (res == 'M')
        for (int i = 1; i <= qtd; i++)
        {
            cin >> nome;
            homens.push_back(nome);
            if (i == qtd)
                cin >> qtd >> res;
        }

    if (res == 'F')
        for (int i = 1; i <= qtd; i++)
        {
            cin >> nome;
            mulheres.push_back(nome);
            if (i == qtd)
                cin >> qtd >> res;
        }

    if (res == 'C')
        for (int i = 1; i <= qtd; i++)
        {
            cin >> nome >> nome2;
            dupla.first = nome;
            dupla.second = nome2;
            casais.push_back(dupla);
            if (i == qtd)
                cin >> qtd;
        }

    // for (int i = 0; i < qtd; i++)
    // {
    //     cin >> nome >> res >> nome2 >> pontuacao;
    //     dupla.first = nome;
    //     dupla.second = nome2;
    //     afinidade.push_back(dupla);
    //     pontuacaoAfinidade.push_back(pontuacao);
    // }
    printf("(define (problem teste001)\n(:domain hotel_domain)\n");
    printf("(:objects\n");
    for (int i = 0; i < homens.size(); i++)

        cout << homens[i] << " ";

    for (int i = 0; i < mulheres.size(); i++)

        cout << mulheres[i] << " ";

    printf(" - pessoa\n");
    for (int i = 0; i < quartos.size(); i++)
        cout << "quarto" << i + 1 << " ";
    printf(" - quarto\n)\n");
    // aqui acabam os objetos

    printf("(:init\n");
    for (int i = 0; i < homens.size(); i++)
        cout << "(homem " << homens[i] << ")\n";

    for (int i = 0; i < mulheres.size(); i++)
        cout << "(mulher " << mulheres[i] << ")\n";

    for (int i = 0; i < casais.size(); i++)
        cout << "(casal " << casais[i].first << " " << casais[i].second << ")\n";

    for (int i = 0; i < quartos.size(); i++)
        switch (quartos[i].first)
        {
        case 'C':
            cout << "(quartoCasal quarto" << i + 1 << ")\n(= (custo quarto" << i + 1 << ") " << quartos[i].second << ")\n";
            break;
        case 'D':
            cout << "(quartoDuplo quarto" << i + 1 << ")\n(= (custo quarto" << i + 1 << ") " << quartos[i].second << ")\n";
            break;
        case 'T':
            cout << "(quartoTriplo quarto" << i + 1 << ")\n(= (custo quarto" << i + 1 << ") " << quartos[i].second << ")\n";
            break;
        case 'Q':
            cout << "(quartoQuadruplo quarto" << i + 1 << ")\n(= (custo quarto" << i + 1 << ") " << quartos[i].second << ")\n";
            break;
        default:
            break;
        }
    cout << ")\n";
    // aqui acaba o estado inicial
    printf("(:goal\n(and\n");
    for (int i = 0; i < homens.size(); i++)
        cout << "(alojada " << homens[i] << ")\n";

    for (int i = 0; i < mulheres.size(); i++)
        cout << "(alojada " << mulheres[i] << ")\n";
    printf(")\n)\n");
    printf("(:metric minimize\n(total-cost)))\n");

    return 0;
}