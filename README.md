# i3Geo Softwate básico 
[![Docker Build Statu](https://img.shields.io/docker/build/i3geo/software-base.svg)](https://hub.docker.com/r/i3geo/software-base/builds/)
[![Docker Pulls](https://img.shields.io/docker/pulls/i3geo/software-base.svg)](https://hub.docker.com/r/i3geo/software-base/builds/)

O objetivo desta imagem Docker é prover o software básico para utilização do i3Geo. Para o desenvolvedor este é um mecanismo que apoia o processo de criação de novas funcionalidades uma vez que todas as dependencias já estão instaladas.

Para utilizar em modo de desenvolvimento:

*  Instale a última versão do Docker em seu computador;
*  Faça checkout do i3geo a partir do gitHub;
*  Entre na pasta onde está o código;
*  Digite o comando `docker run -it -p 80:8080 -v $PWD:/var/www/i3geo --rm i3geo/software-base`
*  Inicie o apache `apachectl start`
*  Acesso navegador e digite `http://localhost/i3geo`

O comando acima do docker faz com que o usuário entre na instância da imagem i3geo já com o código no DOC_ROOT do apache, sendo assim, basta escolher o editor de sua preferência e alterar o código.