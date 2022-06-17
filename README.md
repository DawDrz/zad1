Zadanie 1

3. 

Polecenie do zbudowania obrazu kontenera:
`docker build -t dawiddrzew/zad1 .`

Polecenie do uruchomienia kontenera:
`docker run -d --name zad1 -p 8080:8080 dawiddrzew/zad1`

Polecenie do uzyskania informacji, które wygenerował serwer przy starcie:
`docker logs zad1`

Polecenie do sprawdzenia ile warstw posiada obraz:
`docker history dawiddrzew/zad1`

Zrzut ekranu okna przeglądarki:

![img.png](zrzut_ekranu.png)

4. 

Przed zbudowaniem obrazów należy wykonać polecenia:

`docker run --rm --privileged multiarch/qemu-user-static --reset -p yes`

`docker buildx create --name builder --driver builder --bootstrap --use`

Za pomocą buildx można zbudować obrazy na wskazane architektury:

`docker buildx build -t dawiddrzew/zad1 --platform linux/arm64/v8,linux/amd64 . --push`


Dodatek 1.
