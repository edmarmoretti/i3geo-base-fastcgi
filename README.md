# i3Geo Softwate básico 
[![Docker Build Statu](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/synapsetec/i3geo-base/)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/_/ubuntu/latest.svg)](https://hub.docker.com/r/synapsetec/i3geo-base)
[![Docker Pulls](https://img.shields.io/docker/pulls/mashape/kong.svg)](https://hub.docker.com/r/synapsetec/i3geo-base/)

O objetivo desta imagem Docker é prover o software básico para utilização do i3Geo. Para o desenvolvedor este é um mecanismo que apoia o processo de criação novas funcinalidades uma vez que todas as dependencias já estão instaladas nesta imagem.

Para utilizar em modo de desenvolvimento:

*  Instale a última versão do Docker em seu computador;
*  Faça checkout do i3geo a partir do gitHub;
*  Entre na pasta onde está o código;
*  Digite o comando `docker run -it -p 80:80 -v $PWD:/var/www/i3geo --rm synapsetec/i3geo`
* Inicie o apache `apachectl start`

O comando acima do docker faz com que o usuário entre na instância da imagem i3geo já com o código no DOC_ROOT do apache, sendo assim, basta escolher o editor de sua preferência e alterar o código.