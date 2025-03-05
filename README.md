
This project is a refactor + extend of OpenMAS docker OPT, developed by Gustavo for his Doctor thesis, you can check it out more about at the [original](https://github.com/GustavoLLima/open_mas_docker_opt) github and also [this](https://ieeexplore.ieee.org/document/10371883) article written by him.

The idea behind is to build an docker based architecture/framework to facilitate the development of open multi-agent systems.

## Why a refactor?

[open_mas_docker_opt](https://github.com/GustavoLLima/open_mas_docker_opt)  in a stage of prototype, meaning, that agent models are hardcoded into the platform. In addition everything was pretty much done by scracth even things that already have an proper solution.

## Extending

The extension of this architecture/framework is a piece of work I'm doing for my Master dissertation. The idea is to make this generic enough so minimal code is necessary besides the models themselves. In addition, for my dissertation, the idea is to a container with an LLM and also somehow add a RAG as an interface so agents can learn and adapt from these two.

