; TODO
; após ir de uma estação a outra, esperar 5 min (ou mais, se não houver bicicleta disponível)
; 
; implementar caminhar
; implementar visitou-ponto
; implementar esperar-5min
;
(define (domain turismo-multimodal-a)
    (:requirements :strips)
    (:predicates
        (at ?what ?estacao)
        (pegou-bike ?who ?bike)
        (adjacente ?estacao-1 ?estacao-2)
        (is-ciclista ?who)
        (is-bike ?what)
        (is-estacao ?where)
        (is-ponto ?where)
        (foi-visitada ?estacao ?ciclista)
        (visitou-ponto ?ponto-turistico ?ciclista)
        (esperou-5min ?who)
        (devolveu-bike ?who)
    )
    (:action pegar-bike
        :parameters 
            (?who ?bike ?where)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-bike ?bike)
            (is-estacao ?where)
            (at ?who ?where)
            (at ?bike ?where)
            (not (pegou-bike ?who ?bike))
            ;(esperou-5min ?who)
        )
        :effect 
            (and  
            (pegou-bike ?who ?bike)
            (not (at ?bike ?where))
            (not (devolveu-bike ?who))
        )
    )

    (:action devolver-bike
        :parameters 
            (?who ?bike ?where)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-bike ?bike)
            (at ?who ?where)
            (not (at ?bike ?where))
            (pegou-bike ?who ?bike)
            (not (devolveu-bike ?who))
            (is-estacao ?where)
        )
        :effect 
            (and  
            (not (pegou-bike ?who ?bike))
            (at ?bike ?where)
            (devolveu-bike ?who)
        )
    )

    (:action pedalar
        :parameters 
            (?who ?bike ?from ?to)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-bike ?bike)
            (is-estacao ?from)
            (is-estacao ?to)
            (at ?who ?from)
            (adjacente ?from ?to)
            (pegou-bike ?who ?bike)
            (esperou-5min ?who)
        )
        :effect 
            (and 
            (not (at ?who ?from))
            (at ?who ?to)
            (foi-visitada ?to ?who)
            (not(esperou-5min ?who))
        )
    )

    (:action caminhar
        :parameters 
            (?who ?estacao ?ponto-turistico)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-estacao ?estacao)       
            (is-ponto ?ponto-turistico)  
            (at ?who ?estacao)
            (adjacente ?estacao ?ponto-turistico)
            (not(visitou-ponto ?ponto-turistico ?who))
            (devolveu-bike ?who)
        )
        :effect 
            (and 
            (at ?who ?ponto-turistico)
            (visitou-ponto ?ponto-turistico ?who)
            (esperou-5min ?who)
        )
    )

    (:action caminhar-volta
        :parameters 
            (?who ?ponto-turistico ?estacao)
        :precondition 
            (and 
            (is-ciclista ?who)
            (is-estacao ?estacao)        
            (is-ponto ?ponto-turistico)  
            (at ?who ?ponto-turistico)
            (adjacente ?ponto-turistico ?estacao)
        )
        :effect 
            (and 
            (at ?who ?estacao)            
        )
    )

    (:action esperar-5min
        :parameters 
            (?who)
        :precondition 
            (and 
            (is-ciclista ?who)
            (not(esperou-5min ?who))
        )
        :effect 
            (and             
            ;(esperou-5min ?who)
        )
    )
)