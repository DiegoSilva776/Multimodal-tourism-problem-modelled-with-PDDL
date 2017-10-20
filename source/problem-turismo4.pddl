;
; Definição do problema do Turismo Multimodal 
;
(define (problem turismo-multimodal-a-1)

	(:domain turismo-multimodal-a)

	(:objects 
		estacao-1 estacao-2 estacao-3 estacao-4 estacao-5 estacao-6
            pca-republica banco-brasil paco-alfandega mercado-sj igreja-nsarp
		bike-1 bike-2 bike-3 bike-4 bike-5 bike-6 bike-7 bike-8
		jose maria joao
	)

	(:init 
            ; Define o tipo de cada elemento do domínio
            (is-ciclista jose)
            (is-ciclista maria)
            (is-ciclista joao)

            (is-bike bike-1)
            (is-bike bike-2)
            (is-bike bike-3)
            (is-bike bike-4)
            (is-bike bike-5)
            (is-bike bike-6)
            (is-bike bike-7)
            (is-bike bike-8)

            (is-estacao estacao-1)
            (is-estacao estacao-2)
            (is-estacao estacao-3)
            (is-estacao estacao-4)
            (is-estacao estacao-5)
            (is-estacao estacao-6)

            (is-ponto-turistico pca-republica)
            (is-ponto-turistico banco-brasil)
            (is-ponto-turistico paco-alfandega)
            (is-ponto-turistico mercado-sj)
            (is-ponto-turistico igreja-nsarp)

            ; Define o status de cada elemento do domínio
		(adjacente estacao-1 estacao-2) (adjacente estacao-2 estacao-1)
		(adjacente estacao-2 estacao-3) (adjacente estacao-3 estacao-2)
		(adjacente estacao-3 estacao-4) (adjacente estacao-4 estacao-3)
		(adjacente estacao-4 estacao-5) (adjacente estacao-5 estacao-4)
		(adjacente estacao-5 estacao-6) (adjacente estacao-6 estacao-5)
		(adjacente estacao-6 estacao-1) (adjacente estacao-1 estacao-6)
		(adjacente estacao-6 estacao-4) (adjacente estacao-4 estacao-6)

            (adjacente estacao-1 pca-republica) (adjacente pca-republica estacao-1)
            (adjacente estacao-2 banco-brasil) (adjacente banco-brasil estacao-2)
            (adjacente estacao-3 paco-alfandega) (adjacente paco-alfandega estacao-3)
            (adjacente estacao-5 mercado-sj) (adjacente mercado-sj estacao-5)
            (adjacente estacao-6 igreja-nsarp) (adjacente igreja-nsarp estacao-6)

		(at jose estacao-2)
		(at maria estacao-3)
		(at joao estacao-6)

		(at bike-1 estacao-1)
		(at bike-2 estacao-2)
		(at bike-3 estacao-4)
		(at bike-4 estacao-4)
		(at bike-5 estacao-4)
		(at bike-6 estacao-5)
		(at bike-7 estacao-5)
		(at bike-8 estacao-6)

            (not (visitou-ponto-turistico pca-republica jose))
            (not (visitou-ponto-turistico banco-brasil jose))
            (not (visitou-ponto-turistico paco-alfandega jose))
            (not (visitou-ponto-turistico mercado-sj jose))
            (not (visitou-ponto-turistico igreja-nsarp jose))

            (not (visitou-ponto-turistico pca-republica maria))
            (not (visitou-ponto-turistico banco-brasil maria))
            (not (visitou-ponto-turistico paco-alfandega maria))
            (not (visitou-ponto-turistico mercado-sj maria))
            (not (visitou-ponto-turistico igreja-nsarp maria))

            (not (visitou-ponto-turistico pca-republica joao))
            (not (visitou-ponto-turistico banco-brasil joao))
            (not (visitou-ponto-turistico paco-alfandega joao))
            (not (visitou-ponto-turistico mercado-sj joao))
            (not (visitou-ponto-turistico igreja-nsarp joao))
	)
   
	(:goal 
		(and 
                  ; Todos os ciclistas visitam todas as estações
			(visitou-estacao estacao-1 jose) 
			(visitou-estacao estacao-2 jose)
			(visitou-estacao estacao-3 jose)
			(visitou-estacao estacao-4 jose)
			(visitou-estacao estacao-5 jose)
			(visitou-estacao estacao-6 jose)

			(visitou-estacao estacao-1 maria) 
			(visitou-estacao estacao-2 maria)
			(visitou-estacao estacao-3 maria)
			(visitou-estacao estacao-4 maria)
			(visitou-estacao estacao-5 maria)
			(visitou-estacao estacao-6 maria)

			(visitou-estacao estacao-1 joao) 
			(visitou-estacao estacao-2 joao)
			(visitou-estacao estacao-3 joao)
			(visitou-estacao estacao-4 joao)
			(visitou-estacao estacao-5 joao)
			(visitou-estacao estacao-6 joao)

                  ; Todos os ciclistas visitam todos os pontos turísticos
                  (visitou-ponto-turistico pca-republica jose)
                  (visitou-ponto-turistico banco-brasil jose)
                  (visitou-ponto-turistico paco-alfandega jose)
                  (visitou-ponto-turistico mercado-sj jose)
                  (visitou-ponto-turistico igreja-nsarp jose)

                  (visitou-ponto-turistico pca-republica maria)
                  (visitou-ponto-turistico banco-brasil maria)
                  (visitou-ponto-turistico paco-alfandega maria)
                  (visitou-ponto-turistico mercado-sj maria)
                  (visitou-ponto-turistico igreja-nsarp maria)

                  (visitou-ponto-turistico pca-republica joao)
                  (visitou-ponto-turistico banco-brasil joao)
                  (visitou-ponto-turistico paco-alfandega joao)
                  (visitou-ponto-turistico mercado-sj joao)
                  (visitou-ponto-turistico igreja-nsarp joao)

                  ; Todos os ciclistas devolvem as bikes
                  (not (pegou-bike jose bike-1))
                  (not (pegou-bike jose bike-2))
                  (not (pegou-bike jose bike-3))
                  (not (pegou-bike jose bike-4))
                  (not (pegou-bike jose bike-5))
                  (not (pegou-bike jose bike-6))
                  (not (pegou-bike jose bike-7))
                  (not (pegou-bike jose bike-8))

                  (not (pegou-bike maria bike-1))
                  (not (pegou-bike maria bike-2))
                  (not (pegou-bike maria bike-3))
                  (not (pegou-bike maria bike-4))
                  (not (pegou-bike maria bike-5))
                  (not (pegou-bike maria bike-6))
                  (not (pegou-bike maria bike-7))
                  (not (pegou-bike maria bike-8))

                  (not (pegou-bike joao bike-1))
                  (not (pegou-bike joao bike-2))
                  (not (pegou-bike joao bike-3))
                  (not (pegou-bike joao bike-4))
                  (not (pegou-bike joao bike-5))
                  (not (pegou-bike joao bike-6))
                  (not (pegou-bike joao bike-7))
                  (not (pegou-bike joao bike-8))
		)
	)
)
