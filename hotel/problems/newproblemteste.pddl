(define (problem newteste001)
  (:domain newdomain)
  (:objects
    Bruno Otaviano Casimiro Igor DavyJones Iasmine Chris Vanessa Rose - pessoa
    quarto1 quarto2 quarto3 quarto4 quarto5 quarto6 quarto7 quarto8 quarto9 quarto10 - quarto
  )
  (:init

    ;; Definir os quartos como disponíveis
    (not (ocupado quarto1))
    (not (ocupado quarto2))
    (not (ocupado quarto3))
    (not (ocupado quarto4))
    (not (ocupado quarto5))
    (not (ocupado quarto6))
    (not (ocupado quarto7))
    (not (ocupado quarto8))
    (not (ocupado quarto9))
    (not (ocupado quarto1))

    ;; Definir a pessoa como não alocada
    (not (alojada Bruno))
    (not (alojada Otaviano))
    (not (alojada Casimiro))
    (not (alojada Igor))
    (not (alojada DavyJones))
    (not (alojada Iasmine))
    (not (alojada Chris))
    (not (alojada Vanessa))
    (not (alojada Rose))

    (homem Bruno)
    (homem Otaviano)
    (homem Casimiro)
    (homem Igor)
    (homem DavyJones)
    (not (homem Iasmine))
    (not (homem Chris))
    (not (homem Vanessa))
    (not (homem Rose))

    (casal Bruno Rose)
    (casal Otaviano Vanessa)

    (= (custo quarto1) 100)
    (= (custo quarto2) 150)
    (= (custo quarto3) 1000)
    (= (custo quarto4) 150)
    (= (custo quarto5) 200)
    (= (custo quarto6) 250)
    (= (custo quarto7) 600)
    (= (custo quarto8) 250)
    (= (custo quarto9) 360)
    (= (custo quarto10) 990)

    (quartoCasal quarto1)
    (quartoCasal quarto2)
    (quartoCasal quarto3)
    (quartoDuplo quarto4)
    (quartoDuplo quarto5)
    (quartoTriplo quarto6)
    (quartoTriplo quarto7)
    (quartoTriplo quarto8)
    (quartoQuadruplo quarto9)
    (quartoQuadruplo quarto10)
  )
  (:goal
    (and
      (alojada Bruno)
      (alojada Otaviano)
      (alojada Casimiro)
      (alojada Igor)
      (alojada DavyJones)
      (alojada Iasmine)
      (alojada Chris)
      (alojada Vanessa)
      (alojada Rose)
    )
  )
  (:metric minimize(total-cost))
)