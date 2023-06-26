(define (problem aloca1)
(:domain newdomain)

  ;; Objetos
  (:objects
    pessoa1 - pessoa
    quarto1 quarto2 quarto3 - quarto
  )

  ;; Inicialização
  (:init
    ;; Definir os quartos como disponíveis
    (not (ocupado quarto1))
    (not (ocupado quarto2))
    (not (ocupado quarto3))

    ;; Definir a pessoa como não alocada
    (not (alojada pessoa1))

    ;; custos dos quartos
    
    (= (custo quarto1) 300)
    (= (custo quarto2) 200)
    (= (custo quarto3) 100)

    ;inicializacao do custo toal
    (= (total-cost) 0)
  )

  ;; Objetivo
  (:goal
    ;; Alocar a pessoa em algum quarto
    (and (alojada pessoa1))
  )
  ;;metricas
  (:metric minimize (total-cost))

)
