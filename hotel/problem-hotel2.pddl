(define (problem teste002)
  (:domain hotel_domain)
  (:objects homem1 - homem
            mulher1  - mulher
            q1 - quarto
            orc - orcamento)

  (:init (casal homem1 mulher1)
        (= (vagas q1) 2)
        (= (max-vagas q1) 2)
        (= (custo q1) 123)
        (= (total orc) 0)      
  )
  (:goal (and
    (no-quarto homem1)
    (no-quarto mulher1)
  ))

  ;(:metric minimize (total orcamento ))
)
