# 5illo

Juego de cartas del Cinquillo escrito en Bash. Se juega en la terminal con la baraja española de 40 cartas, entre 2 y 4 jugadores. El jugador 1 es la persona que ejecuta el script y el resto de jugadores los controla la máquina.

## Reglas que implementa

- Se reparte la baraja completa entre los jugadores.
- La partida empieza con el 5 de Oros.
- En cada turno el jugador coloca una carta válida en la mesa (un 5 abre palo, y a partir de ahí se sube o se baja por orden en ese palo). Si no puede colocar ninguna carta, pasa.
- Gana el primero que se queda sin cartas. Su puntuación es la suma de las cartas que les quedan en la mano al resto de jugadores.

En pantalla se muestra, en cada ronda, la mano de cada jugador y el estado de la mesa separado por palos (Oros, Espadas, Bastos y Copas).

## Uso

```bash
chmod +x 5illo.sh
./5illo.sh
```

El script lee `config.cfg` al arrancar, así que hay que ejecutarlo desde la carpeta del repositorio.

El menú principal tiene estas opciones:

| Opción | Qué hace |
|---|---|
| C | Configuración: número de jugadores (2, 3 o 4), estrategia de la máquina y ruta del fichero de log. Los cambios se guardan en `config.cfg`. |
| J | Empieza una partida. |
| E | Estadísticas calculadas a partir del log: partidas jugadas, tiempo medio y total, media de puntos del ganador y porcentaje de victorias de cada jugador. |
| F | Clasificación: partida más corta, más larga, con más rondas, con menos rondas y la partida en la que un jugador acabó con más cartas. |
| S | Salir. |

## Configuración

`config.cfg` guarda tres valores:

```
JUGADORES=2
ESTRATEGIA=1
LOG=./log/fichero.log
```

En el menú se pueden elegir las estrategias 0, 1 y 2, pero solo está hecha la 0, en la que la máquina juega una carta al azar entre las que tiene. Las estrategias 1 y 2 usan esa misma lógica.

## Fichero de log

Al terminar cada partida se añade una línea a `fichero.log` con este formato:

```
fecha|hora|jugadores|tiempo(s)|rondas|ganador|puntos|cartas_j1-cartas_j2-cartas_j3-cartas_j4
```

Por ejemplo, `23-10-2023|22|4|12|3|4|22|12-2-8-0` es una partida a 4 jugadores que duró 12 segundos y 3 rondas, la ganó el jugador 4 con 22 puntos y el resto acabó con 12, 2 y 8 cartas. Si un jugador no ha participado en la partida, aparece un `*`.

Aunque `config.cfg` define una ruta de log, el script escribe siempre en `fichero.log`, en la carpeta desde la que se ejecuta.

## Archivos

| Archivo | Contenido |
|---|---|
| `5illo.sh` | Programa principal con el menú, la partida, las estadísticas y la clasificación. |
| `config.cfg` | Configuración que lee el programa principal. |
| `fichero.log` | Registro de partidas jugadas. |
| `jugador.sh`, `3jugadores.sh`, `4jugadores.sh`, `estrategias.sh`, `ronda.sh`, `ronda_turno.sh`, `reparto.sh`, `prueba.sh` | Versiones parciales y pruebas que se usaron durante el desarrollo (reparto de cartas, pintado de rondas, partidas con distinto número de jugadores). No hacen falta para jugar. |
