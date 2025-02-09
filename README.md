# Concatenar e reencodifica vídeos

Este script em PowerShell concatena múltiplos arquivos de vídeo MP4 em um único arquivo de saída. Ele utiliza o FFmpeg para processamento de vídeo e garante compatibilidade re-encodando os vídeos de entrada para um formato padrão antes da concatenação.

## Recursos Principais

* **Suporte a múltiplos arquivos MP4:** Aceita vários arquivos MP4 como entrada.
* **Integração com FFmpeg:** Utiliza o FFmpeg para codificação e concatenação eficientes de vídeos.
* **Tratamento de erros:** Inclui tratamento robusto de erros e mensagens informativas.
* **Limpeza de diretório temporário:** Limpa automaticamente os arquivos temporários após o processamento.
* **Re-encoding:** Re-encoda os vídeos de entrada para um formato consistente (1280x720, 30fps) para garantir uma concatenação suave.


## Tecnologias Utilizadas

* **PowerShell:** A linguagem de script usada no projeto.
* **FFmpeg:** Uma poderosa ferramenta de linha de comando para manipulação de arquivos multimídia.


## Pré-requisitos

* **PowerShell 5.1 ou superior:** O script foi desenvolvido para o PowerShell e requer a versão 5.1 ou posterior.
* **FFmpeg:** Você deve ter o FFmpeg instalado e adicionado à variável de ambiente PATH do sistema. Faça o download no site oficial: [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html).

## Instalação

1. **Baixe o script:** Faça o download de `concatenatevideos.ps1` deste repositório.
2. **Instalação do FFmpeg:** Se ainda não o fez, baixe e instale o FFmpeg. Certifique-se de adicionar o diretório que contém `ffmpeg.exe` à variável de ambiente PATH do sistema. Isso permite que o PowerShell encontre e execute o comando FFmpeg. Os passos exatos para adicionar ao PATH dependem do seu sistema operacional. Consulte a documentação do seu SO, se necessário.
3. **Coloque o script:** Salve `concatenatevideos.ps1` no diretório que contém seus arquivos MP4.

## Uso

1. **Coloque seus arquivos MP4:** Coloque todos os arquivos MP4 que deseja concatenar no mesmo diretório que `concatenatevideos.ps1`.
2. **Execute o script:** Abra o PowerShell no diretório onde você salvou o script e execute-o usando o seguinte comando:

   ```powershell
   .\concatenatevideos.ps1
   ```

3. **Saída:** O vídeo concatenado será salvo como `final_output.mp4` no mesmo diretório.

**Exemplo:** Se você tiver `video1.mp4`, `video2.mp4` e `video3.mp4` no mesmo diretório que o script, executar o script criará `final_output.mp4` contendo os três vídeos em sequência.

## Configuração

O script possui configurações internas:

* **`$tempDir`:** Esta variável especifica o diretório temporário usado para os vídeos re-encodados. Está configurado como `temp_videos` dentro do diretório do script.
* **`$outputFile`:** Esta variável define o nome do arquivo de saída. Atualmente está definido como `final_output.mp4`. Você pode modificar essas variáveis diretamente no script, se necessário, embora isso não seja recomendado para usuários comuns. Usuários avançados podem alterar os parâmetros de codificação de vídeo nos comandos do FFmpeg, mas isso requer conhecimento das opções do FFmpeg.

## Estrutura do Projeto

* **`concatenatevideos.ps1`:** O script principal do PowerShell.
* **`LICENSE`:** O arquivo da licença MIT.
* **`README.md`:** Este arquivo.


## Mensagens de Erro

* **"Erro: FFmpeg não encontrado. Instale o FFmpeg e adicione ao PATH."**: Esse erro significa que o FFmpeg não está instalado ou não foi corretamente adicionado à variável de ambiente PATH. Siga a seção de Pré-requisitos para corrigir isso.
* **"Falha na re-codificação de [filename]"**: Indica um erro durante o processo de re-encodificação de um arquivo de vídeo específico. Verifique o arquivo quanto a possíveis corrupções.
* **"Falha na concatenação dos arquivos"**: Significa um erro durante o processo de concatenação. Isso pode ser devido a problemas com os arquivos re-encodados.
* **Outros Erros**: Quaisquer outros erros fornecerão uma mensagem mais detalhada descrevendo o problema encontrado.


## Contribuição

Contribuições são bem-vindas! Por favor, abra uma issue ou envie um pull request.

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.