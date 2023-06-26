(define (problem aloca2)
  (:domain newdomain)

  ;; Objetos
  (:objects
    pessoa1 pessoa2 - pessoa
    quarto1 quarto2 quarto3 - quarto
  )

  ;; Inicialização
  (:init
    ;; Definir os quartos como disponíveis
    (not (ocupado quarto1))
    (not (ocupado quarto2))
    (not (ocupado quarto3))

    ;;Definir os tipos de quartos
    (quartoDuplo quarto1)

    ;; Definir as pessoas como não alocadas
    (not (alojada pessoa1))
    (not (alojada pessoa2))
    (homem pessoa1)
    (homem pessoa2)

    ;; custos dos quartos
    (= (custo quarto1) 300)
    (= (custo quarto2) 200)
    (= (custo quarto3) 200)

    ;; Inicialização do custo total
    (= (total-cost) 0)
  )

  ;; Objetivo
  (:goal
    ;; Alocar ambas as pessoas em algum quarto
    (and (alojada pessoa1) (alojada pessoa2))
  )
  
  ;; Métrica
  (:metric minimize (total-cost))
)
