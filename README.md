# streamlit-template

Template Repo for Streamlit Application

This repo can be used as a starting point for developing your Streamlit App.

Here are some of the features of the template:

- VSCode .devcontainer for local development: [Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
  - docker-compose.yml
  - Dockerfile
- Linting Configuration (allows for clean code and quicker detection of possible bugs as one of the first steps in Shift-left testing)
  - [Black](https://black.readthedocs.io/en/stable/index.html)
  - [ruff](https://beta.ruff.rs/docs/)
  - [mypy](https://mypy.readthedocs.io/en/stable/index.html)
- Unit Tests
  - [pytest](https://docs.pytest.org/)

# Start Here to Develop

1. Prerequisites

- Install [Visual Studio Code](https://code.visualstudio.com/)
- Install [Visual Studo Code Extension - Dev containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- Install [Docker](https://www.docker.com/)

2. Confirm Docker is installed by executing command `docker -v`
3. Open VSCode to a New Window and open this repository's directory
4. You may see a notification that the Folder containers a Dev Container configuration file. If so, click on "Reopen in Container"

- If you do not see this notification, press `F1` key and begin typing the following until you can see the option "Dev Containers: Rebuild and reopen in Container".
- This action will reopen the VSCode within a Docker container suitable to develop and locally run the application.

5. The dev container will start up the Streamlit application.

- To access the application, navigate to http://localhost:8501
  - The container forwards the port 8501 where the Streamlit application is hosted
- Any changes made to the code will be reflected in the Streamlit application when you refresh.

6. Now inside the VSCode dev container, to run tests, execute `./tests/run_tests.sh`

- This script has an optional argument `-f` for "fix mode" which allows for configuration of black and ruff to automatically apply fixes.

7. As functions are added to the application, unit tests can/should be added in `tests/unit`, with existing support utilizing the `pytest` library.
