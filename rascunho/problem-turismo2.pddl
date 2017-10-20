; TODO
; após ir de uma uma estação a outra, esperar 5 minutos (ou mais, se não houver bicicleta disponível)
; 
; implementar caminhar
; implementar visitar-ponto
; implementar esperar5min
; 
(define (problem turismo-multimodal-a-1)
	(:domain turismo-multimodal-a)
	(:objects 
		estacao-1 estacao-2 estacao-3
		estacao-4 estacao-5 estacao-6
		bike-1 bike-2 bike-3 bike-4 bike-5
		bike-6 bike-7 bike-8
		jose maria joao
		pca-republica banco-brasil
		paco-alfandega mercado-sj 
		igreja-nsarp
	)
	(:init 
		(adjacente estacao-1 estacao-2) (adjacente estacao-2 estacao-1)
		(adjacente estacao-2 estacao-3) (adjacente estacao-3 estacao-2)
		(adjacente estacao-3 estacao-4) (adjacente estacao-4 estacao-3)
		(adjacente estacao-4 estacao-5) (adjacente estacao-5 estacao-4)
		(adjacente estacao-5 estacao-6) (adjacente estacao-6 estacao-5)
		(adjacente estacao-6 estacao-1) (adjacente estacao-1 estacao-6)
		(adjacente estacao-6 estacao-4) (adjacente estacao-4 estacao-6)

		(is-ciclista jose)
		(at jose estacao-2)

		(is-ciclista maria)
		(at maria estacao-3)

		(is-ciclista joao)
		(at joao estacao-6)
		
		(is-bike bike-1)
		(at bike-1 estacao-1)

		(is-bike bike-2)
		(at bike-2 estacao-2)

		(is-bike bike-3)
		(at bike-3 estacao-4)

		(is-bike bike-4)
		(at bike-4 estacao-4)

		(is-bike bike-5)
		(at bike-5 estacao-4)

		(is-bike bike-6)
		(at bike-6 estacao-5)

		(is-bike bike-7)
		(at bike-7 estacao-5)

		(is-bike bike-8)
		(at bike-8 estacao-6)
	)
	(:goal 
		(and 
			(foi-visitada estacao-1 jose) 
			(foi-visitada estacao-2 jose)
			(foi-visitada estacao-3 jose)
			(foi-visitada estacao-4 jose)
			(foi-visitada estacao-5 jose)
			(foi-visitada estacao-6 jose)

			(foi-visitada estacao-1 maria) 
			(foi-visitada estacao-2 maria)
			(foi-visitada estacao-3 maria)
			(foi-visitada estacao-4 maria)
			(foi-visitada estacao-5 maria)
			(foi-visitada estacao-6 maria)

			(foi-visitada estacao-1 joao) 
			(foi-visitada estacao-2 joao)
			(foi-visitada estacao-3 joao)
			(foi-visitada estacao-4 joao)
			(foi-visitada estacao-5 joao)
			(foi-visitada estacao-6 joao)

			;(at jose estacao-2)
			;(at maria estacao-3)
			;(at joao estacao-6)
		)
	)
)
