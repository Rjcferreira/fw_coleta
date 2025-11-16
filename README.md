📦 Sistema de Coleta – OX Framework

Sistema de coleta totalmente integrado ao OX Framework, criado para oferecer uma mecânica simples, leve e plug & play para servidores FiveM. Ideal para servidores que desejam adicionar coleta de recursos, farm de itens ou mecânicas de trabalho de forma otimizada e fácil de configurar.

✨ Funcionalidades

Integração completa com ox_lib, ox_target e ox_inventory

Totalmente configurável via config.lua

Suporte a múltiplos pontos de coleta

Animações opcionais durante a coleta

Permissões configuráveis (jobs, grupos, etc.)

Sistema plug & play — pronto para uso imediato

Performance otimizada (0.00ms idle)

📁 Estrutura do Recurso

sistema-coleta/
│── client.lua
│── server.lua
│── config.lua
│── fxmanifest.lua

⚙️ Instalação

Baixe ou clone este repositório:
git clone https://github.com/seu-usuario/sistema-coleta

Coloque a pasta na sua pasta de recursos do FiveM:
resources/[ox]/sistema-coleta

Adicione ao seu server.cfg:
ensure sistema-coleta

Configure os pontos de coleta no arquivo config.lua.

🛠️ Configuração (Exemplo)

Config.Coletas = {
{
label = "Coletar Madeira",
coords = vec3(-534.21, 5372.91, 70.46),
item = "madeira",
quantidade = 1,
anim = true,
tempo = 3000
},
{
label = "Coletar Minério",
coords = vec3(2954.72, 2785.10, 41.50),
item = "minerio",
quantidade = 1,
anim = false,
tempo = 2000
}
}

🎮 Como Funciona

O jogador se aproxima do ponto configurado.

O ox_target mostra a opção de coleta.

Ao interagir, o sistema executa animação (se ativada) e o tempo configurado.

O item é adicionado ao ox_inventory do jogador.

🤝 Contribuições

Contribuições são bem-vindas! Para contribuir, faça um fork, crie uma branch com sua alteração e envie um Pull Request.

📄 Licença

Este projeto é distribuído sob a licença MIT. Você pode usar, modificar e redistribuir livremente.

🔗 Links Úteis

Discord: https://discord.gg/6nHCTndkfq

Loja (Tebex): https://flowstore.tebex.io/

GitHub FlowStore: https://github.com/Rjcferreira

YouTube: https://youtube.com/@flow_store
