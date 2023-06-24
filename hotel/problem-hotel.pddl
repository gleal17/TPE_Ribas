(define (problem teste001)
  (:domain hotel_domain)
  (:objects
    homem1 homem2 homem3 homem4 - pessoa
    mulher1 mulher2 mulher3 mulher4 - pessoa
    quarto1 quarto2 quarto3 quarto4 quarto5 quarto6 - quarto
  )

  (:init
    (casal homem1 mulher1)
    (casal homem2 mulher2)
    (casal homem3 mulher3)
    (casal homem4 mulher4)
    (homem homem1)
    (homem homem2)
    (homem homem3)
    (homem homem4)
    (mulher mulher1)
    (mulher mulher2)
    (mulher mulher3)
    (mulher mulher4)

    (quartoQuadruplo quarto1)
    (= (custo quarto1) 1230)
    
    (quartoCasal quarto2)
    (= (custo quarto2) 500)
    
    (quartoTriplo quarto3)
    (= (custo quarto3) 400)
    
    (quartoDuplo quarto4)
    (= (custo quarto4) 300)
    
    (quartoDuplo quarto5)
    (= (custo quarto5) 200)
    
    (quartoDuplo quarto6)
    (= (custo quarto6) 100)
    
    (= (total-cost) 0)
  )
  (:goal
    (and
      (alojada homem1)
      (alojada homem2)
      (alojada homem3)
      (alojada homem4)
      (alojada mulher1)
      (alojada mulher2)
      (alojada mulher3)
      (alojada mulher4)
    )
  )

  (:metric minimize
    (total-cost))
)