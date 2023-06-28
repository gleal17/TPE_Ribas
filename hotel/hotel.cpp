#include <bits/stdc++.h>

using namespace std;

int main()
{
    int qtd;
    char res;
    vector<string> homens;
    vector<string> mulheres;
    pair<string, string> dupla;
    vector<pair<string, string>> casais;
    vector<int> pontuacaoAfinidade;
    map<pair<string, string>, int> afinidadeGeral;
    string nome, nome2, linha, afinidadeString;
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
        }

    cin >> qtd >> res;
    if (res == 'F')
        for (int i = 1; i <= qtd; i++)
        {
            cin >> nome;
            mulheres.push_back(nome);
        }

    cin >> qtd >> res;
    if (res == 'C')
        for (int i = 1; i <= qtd; i++)
        {
            cin >> nome >> nome2;
            dupla.first = nome;
            dupla.second = nome2;
            casais.push_back(dupla);
            afinidadeGeral.insert(make_pair(dupla, 100));
            dupla.first = nome2;
            dupla.second = nome;
            casais.push_back(dupla);
            afinidadeGeral.insert(make_pair(dupla, 100));
        }

    scanf("%d%*c", &qtd);
    int percorredorDeLinha;
    for (int i = 0; i < qtd; i++)
    {
        nome = "";
        linha = "";
        getline(cin, linha);
        for (percorredorDeLinha = 0; linha[percorredorDeLinha] != ' '; percorredorDeLinha++)
        {
            nome += linha[percorredorDeLinha];
        }
        percorredorDeLinha += 3;
        dupla.first = nome;
        nome = "";
        afinidadeString = "";
        for (; percorredorDeLinha < linha.length(); percorredorDeLinha++)
        {
            if (linha[percorredorDeLinha] == ' ')
            {
                for (percorredorDeLinha += 1; percorredorDeLinha < linha.length() && linha[percorredorDeLinha] != ' '; percorredorDeLinha++)
                    afinidadeString += linha[percorredorDeLinha];
                dupla.second = nome;
                afinidadeGeral.insert(make_pair(dupla, stoi(afinidadeString)));
                nome = "";
                afinidadeString = "";
            }
            else
                nome += linha[percorredorDeLinha];
        }
    }
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
    for (int i = 0; i < casais.size(); i++)
        cout << "(casal " << casais[i].first << " " << casais[i].second << ")\n";

    for (int i = 0; i < homens.size(); i++)
    {
        for (int j = 0; j < homens.size(); j++)
        {
            if(homens[i] == homens[j])
                continue;
            dupla.first = homens[i];
            dupla.second = homens[j];
            if (afinidadeGeral.find(dupla) != afinidadeGeral.end())
            {
                if (afinidadeGeral[dupla] >= 50)
                    cout << "(podeJunto " << homens[i] << " " << homens[j] << ")\n";
            }
            else
                cout << "(podeJunto " << homens[i] << " " << homens[j] << ")\n";
        }
        for (int j = 0; j < mulheres.size(); j++)
        {
            dupla.first = homens[i];
            dupla.second = mulheres[j];
            if (afinidadeGeral.find(dupla) != afinidadeGeral.end())
            {
                if (afinidadeGeral[dupla] >= 50)
                    cout << "(podeJunto " << homens[i] << " " << mulheres[j] << ")\n";
            }
        }
    }

    for (int i = 0; i < mulheres.size(); i++)
    {
        for (int j = 0; j < homens.size(); j++)
        {
            dupla.first = mulheres[i];
            dupla.second = homens[j];
            if (afinidadeGeral.find(dupla) != afinidadeGeral.end())
            {
                if (afinidadeGeral[dupla] >= 50)
                    cout << "(podeJunto " << mulheres[i] << " " << homens[j] << ")\n";
            }
        }
        for (int j = 0; j < mulheres.size(); j++)
        {
            if(mulheres[i] == mulheres[j])
                continue;
            dupla.first = mulheres[i];
            dupla.second = mulheres[j];
            if (afinidadeGeral.find(dupla) != afinidadeGeral.end())
            {
                if (afinidadeGeral[dupla] >= 50)
                    cout << "(podeJunto " << mulheres[i] << " " << mulheres[j] << ")\n";
            }
            else
                cout << "(podeJunto " << mulheres[i] << " " << mulheres[j] << ")\n";
        }
    }

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
    printf("(= (total-cost) 0)\n");
    cout << ")\n";
    // aqui acaba o estado inicial
    printf("(:goal\n(and\n");
    for (int i = 0; i < homens.size(); i++)
        cout << "(alojada " << homens[i] << ")\n";

    for (int i = 0; i < mulheres.size(); i++)
        cout << "(alojada " << mulheres[i] << ")\n";
    for (int i=0; i < casais.size(); i++)
        cout << "(casalAlojado " << casais[i].first << " " << casais[i].second << ")\n";
    printf(")\n)\n");
    printf("(:metric minimize (total-cost)))");

    return 0;
}