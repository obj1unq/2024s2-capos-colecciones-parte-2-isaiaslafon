# Capos

Este ejercicio está pensado para explicar colecciones.
La parte 1 incluye todo lo referido a referencias y tipos de colecciones
La parte 2 trabaja sobre el envío de mensajes polimórficos a los elementos

## Parte 1 (referencias)


### Rolando

Se trata de un juego en el cual nuestro personaje, Rolando, va recolectando distintos artefactos por el mundo.
Para la primera versión, existen 4 artefactos:

- Espada del destino
- Libro de hechizos 
- Collar divino
- Armadura de acero valyrio

Al principio Rolando solo puede llevar hasta 2 artefactos a la vez, 
pero se espera que a medida que se desarrolla el juego pueda incrementar 
su capacidad.

Cada vez que rolando se encuentra con un artefacto, y tiene capacidad para llevarlo, lo levanta. 

#### Ejemplo:
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando encuentra el collar divino (no lo agarra, ya que tiene la espada y el libro encima y su capacidad es de 2)

### Castillo de piedra

El castillo de piedra es donde Rolando vive. Es tan grande que allí no hay límite 
para almacenar artefactos.
Cuando rolando llega al castillo de piedra guarda en él todos los artefactos que lleva encima, 
liberando espacio para poder levantar nuevos. 

#### Ejemplo:
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando llega al castillo de piedra (deja en el castillo la espada y el libro de hechizos)
 4. rolando encuentra el collar divino (ahora si lo puede agarrar, ya que liberó espacio)
 3. rolando llega al castillo de piedra de nuevo(deja el collar, con lo cual ahora el castillo tiene el collar, la espada y el libro)
 

### Saber los artefactos de Rolando
 Hay dos preguntas interesantes que debe poder contestar Rolando, por un lado cuales son los artefactos que tiene encima 
 (ya resuelto en el punto anterior), pero también debe saber cuales son todos los artefactos que él posee 
 sin importar si lo tiene encima o en su castillo.
 
 También se quiere preguntar si posee un artefacto en especial.
 
#### Ejemplo: 
	Si el castillo tiene el collar, la espada. Rolando tiene la armadura. 
	Entonces rolando posee el collar, la espada y la armadura.
	El libro no lo posee.
 
### Saber la historia de los encuentros con los artefactos.
 
 Se desea saber el orden en que rolando fue encontrándose los artefactos, 
 independientemente de si los agarró o no.
 
#### Ejemplo:
 
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando encuentra el collar divino (no lo agarra, ya que tiene la espada y el libro encima y su capacidad es de 2)
 4. rolando llega al castillo de piedra (deja en el castillo la espada y el libro de hechizos)
 5. rolando encuentra la armadura de acero valyrio (la agarra)
 6. rolando encuentra el collar divino (ahora si lo puede agarrar, ya que liberó espacio)
 
Si consultamos la historia de encuentro con los artefactos debería ser:
 1. espada del destino 
 2. libro de hechizos
 3. collar divino
 4. armadura de acero valyrio
 5. collar divino (de nuevo!)
 
## Parte 2 (mensajes con bloques) 

### Comportamiento de los artefactos

Los artefactos son elementos que aportan poder en una batalla al personaje que lo posee
Pero ojo que cada vez que se combate en una batalla sufren efectos. El poder de pelea
de rolando, va a depender de un valor base (inicialmente configurable) 
y de sus artefactos. Tener en cuenta al momento de programar los artefactos que éstos podrían ser
usados por otros personajes que aún se han introducido.
  
- Espada del destino: Las primera vez que se utiliza aporta la misma cantidad que el poder base del personaje, 
luego sólo el 50%. 
- Collar divino: aporta 3 puntos, pero si el personaje tiene un poder base mayor a 6,
 le suma también un punto por cada batalla en las que se haya usado el collar.
- Armadura de acero valyrio: Aporta 6 de poder de pelea siempre, el acero valyrio no se gasta con las batallas.

_Nota_ La regla del libro de hechizos se define más adelante.

El poder de pelea de rolando es la suma su poder base (que inicialmente es 5) más la sumatoria 
de los poderes de pelea que le aportan los artefactos que tiene encima. 
Cuando ocurre una batalla, se utilizan todos los artefactos que rolando lleva encima 
y además se incremente en 1 el número base del poder de pelea de rolando. 

*Requerimientos* 
- Hacer que Rolando luche una batalla
- Saber el poder de pelea de Rolando
 
#### Ejemplo de batalla: 

- Hacer que Rolando tenga 5 de base y capacidad de 3 artefactos. Entre sus artefactos 
se encuentran la *espada* (que le aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3).
- Luego de la primer batalla Rolando tiene 6 de base, la espada (aporta 6/2 = 3), la armadura (aporta 6) y el collar (aporta 3),   
- Luego de la segunda batalla Rolando tiene 7 de base, la espada (aporta 7/2 = 3.5), la armadura 6 y el collar (3+2=5),   
- Luego de la tercera batalla Rolando tiene 8 de base, la espada (aporta 8/2=4), la armadura 6 y el collar (3+3=6),   
   
#### Ejemplo de poder de pelea: 

- Si Rolando tiene 5 de base y capacidad de 3 artefactos. Entre sus artefactos 
se encuentran la *espada* (aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3).
entonces el poder de pelea de rolando es 5 + 5 + 6 + 3 = 19


### Libro de hechizos
- El libro de hechizos contiene varios hechizos, pero solo se pueden usar de uno a la vez. 
Los hechizos están ordenados y se utilizan en ese orden.
Luego de utilizar  un hechizo éste se descarta. Existen estos 3 hechizos (pero podría haber más)
  - Bendición: aporta 4 de poder de pelea
  - Invisibilidad: aporta la misma cantidad que el poder de pelea base del personaje
  - Invocación: Aporta el valor del artefacto más poderoso para el héroe que posee en su morada. (el artefacto del castillo no sufre ningún efecto por la batalla)

Si el libro de hechizos no tiene ningún hechizo, entonces su aporte es nulo.


#### Ejemplo

Suponiendo que Rolando (con 5 de poder de pelea) solo tiene encima el libro de hechizos, mientras que en su castillo tiene 
la espada, la armadura y el collar. (todo sin haber sido usado antes).
El libro de hechizos contiene a estos tres hechizo en este orden: bendición, invisibilidad e invocación.

Antes de la primera batalla, el libro de hechizos aporta 4 de la bendición.
Luego de la primera batalla el libro de hechizos aporta 6 por la invisibilidad.
Luego de la segunda batalla, el libro aporta 7, ya que la invocación otorga los 7 puntos de la espada.
Luego de la tercera batalla, ya no quedan más hechizos, por lo que el aporte del libro es 0


### Enemigos

En la tierra de Erethia existen 3 poderosos enemigos, de cada uno interesa saber su poder de pelea 
y su morada.

- Archibaldo tiene 16 de poder de pelea y vive en el palacio de mármol. 
- Caterina tiene 28 de poder de pelea y vive en la fortaleza de acero
- Astra tiene 14 de poder pelea y vive en la torre de marfil

#### Enemigos vencibles y Moradas Conquistables
Los enemigos en Erethia que Rolando puede vencer son aquellos que tiene un poder de batalla menor al de rolando
A su vez las moradas que roland podría conquistar son las moradas de los enemigos a los cuales puede vencer.

 
Suponiendo que Rolando tiene 5 de base y capacidad de 3 artefactos. Entre sus artefactos 
se encuentran la *espada* (que le aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3).
Su poder de batalla es 19, por lo tanto puede vencer a archibaldo y a astra. 
Las moradas conquistables son el palacio de mármol y la torre de marfil.

#### Poderoso

Rolando es poderoso en la tierra de Erethia si está en condiciones de vencer a todos los enemigos.
En el caso anterior no es poderoso. Pero si ponemos como poder base de rolando 10 entonces sí lo es

#### Artefacto fatal

Saber si rolando tiene encima algún artefacto fatal para luchar contra un enemigo: 
Un artefacto letal es aquel que le da un poder de pelea superior al poder 
de batalla de su enemigo.

Además de saber si cuenta con un artefacto fatal, se le tiene que poder pedir a rolando
un artefacto fatal.


Si rolando tiene de base 15, la espada, la armadura y el collar, entonces cuenta con un artefacto,
que es la espada, para enfrentar a astra. 
Sin embargo no cuenta con ningún artefacto fatal para enfrentar a Caterina.
